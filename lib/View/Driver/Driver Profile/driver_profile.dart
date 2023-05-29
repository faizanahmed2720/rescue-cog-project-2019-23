// ignore_for_file: unused_field

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/src/Controller/auth_controller.dart';
import 'package:untitled/src/Controller/profile_controller.dart';
import 'package:untitled/src/Utils/CommonWidgets/customTextField.dart';

import '../../../src/Theme/colors.dart';
import '../../../src/Controller/driver_controller.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingactionButton.dart';

class DriverProfile extends StatefulWidget {
  const DriverProfile({super.key});

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  final _driverController = Get.put(driverController());

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController residcenceController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  DateTime? selectedDate;
  TextEditingController dropdownController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController vehicleDopdownController = TextEditingController();
  final List<String> vehicleTypes = [
    'Suzuki Bolan',
    'Changhan',
    'Kinglong Van'
  ];
  TextEditingController vehicleNoController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirthController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  final AuthController _authController = AuthController();
  final List<String> genderTypes = ['Male', 'Female', 'Other'];

  File? _imageFile;
  String? _imageUrl;

  String? profileImage;

  Future _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    final url = await _driverController.uploadImageAndGetLink(_imageFile!);
    setState(() {
      _imageUrl = url;
    });
  }

  profileModel user = profileModel(
      fullname: "",
      email: "",
      phoneNo: "",
      password: "",
      residence: "",
      cnic: "",
      gender: "",
      dateofBirth: "",
      profileImage: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  Future get() async {
    user = (await _driverController.getUserDetails()) as profileModel;

    fullnameController.text = user.fullname;
    emailController.text = user.email;
    phoneController.text = user.phoneNo;
    passwordController.text = user.password;
    residcenceController.text = user.residence!;
    cnicController.text = user.cnic!;
    dropdownController.text = user.gender!;
    dateOfBirthController.text = user.dateofBirth!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: primaryColor,
                  ),
                  child: const Text(
                    "YOUR PROFILE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 180, 0, 30),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[700],
                          border: Border.all(
                              color: Colors.white,
                              width: 5.0,
                              style: BorderStyle.solid),
                        ),
                        child: FutureBuilder<Object>(
                            future: _driverController.getUserDetails(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                profileModel userData =
                                    snapshot.data as profileModel;
                                profileImage = userData.profileImage!;
                                return ClipOval(
                                  child: Image.network(
                                    userData.profileImage!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  CustomTextField(
                    controller: fullnameController,
                    icon: Icons.person,
                    placeholder: 'FULLNAME',
                    secureText: false,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: emailController,
                    icon: Icons.person,
                    placeholder: 'Email',
                    secureText: false,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    icon: Icons.phone,
                    placeholder: 'PHONE',
                    secureText: false,
                    type: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: residcenceController,
                    icon: Icons.location_city,
                    placeholder: 'RESIDENCE',
                    secureText: false,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: cnicController,
                    icon: Icons.quick_contacts_dialer_sharp,
                    placeholder: 'CNIC',
                    secureText: false,
                    type: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    value: dropdownController.text.isNotEmpty
                        ? dropdownController.text
                        : null,
                    items: genderTypes
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      dropdownController.text = value!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      icon: Icon(Icons.person),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTap: () => _selectDate(context),
                    readOnly: true,
                    controller: dateOfBirthController,
                    decoration: const InputDecoration(
                      hintText: "Select date",
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Select Date';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: vehicleNoController,
                    icon: Icons.numbers,
                    placeholder: 'VEHICLE NUMBER',
                    secureText: false,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    value: vehicleDopdownController.text.isNotEmpty
                        ? vehicleDopdownController.text
                        : null,
                    items: vehicleTypes
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      vehicleDopdownController.text = value!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Vehicle Type',
                      icon: Icon(Icons.car_rental),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    icon: Icons.password,
                    placeholder: 'Password',
                    secureText: false,
                    type: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FirebaseAuth.instance.signOut();
                      // Get.to(const SplashScreen());
                      driverModel model = driverModel(
                        uid: _driverController.getCurrentUserUid(),
                        fullname: fullnameController.text,
                        email: emailController.text,
                        phoneNo: phoneController.text,
                        password: passwordController.text,
                        residence: residcenceController.text,
                        gender: dropdownController.text,
                        cnic: cnicController.text,
                        dateofBirth: dateOfBirthController.text,
                        profileImage: user.profileImage.toString(),
                        vehicleType: '',
                        vehicleNumber: '',
                      );

                      _driverController.updateUserRecord(model);
                    },
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "Update".toUpperCase(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
