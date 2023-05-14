// ignore_for_file: unused_field

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/src/Controller/auth_controller.dart';
import 'package:untitled/src/Controller/profile_controller.dart';
import 'package:untitled/src/Utils/CommonWidgets/customTextField.dart';
import '../../src/Constants/colors.dart';
import '../../src/Utils/CommonWidgets/CustomBottomNavigationBarWithWallet.dart';
import '../../src/Utils/CommonWidgets/FloatingactionButtonWithNotched.dart';

class UserAccountSetting extends StatefulWidget {
  const UserAccountSetting({super.key});

  @override
  State<UserAccountSetting> createState() => _UserAccountSettingState();
}

class _UserAccountSettingState extends State<UserAccountSetting> {
  final _profileController = Get.put(profileController());

  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController residcenceController = TextEditingController();
  TextEditingController cnicController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();
  DateTime? selectedDate;

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

  TextEditingController dropdownController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthController _authController = AuthController();
  final List<String> genderTypes = ['Male', 'Female', 'Other'];

  File? _imageFile;
  String? _imageUrl;
  Future _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    final url = await _profileController.uploadImageAndGetLink(_imageFile!);
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
      dateofBirth: "");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  Future get() async {
    user = await _profileController.getUserDetails();

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
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
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
                "ACCOUNT SETTING",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // _openGallery();
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
                              future: _profileController.getUserDetails(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  profileModel userData =
                                      snapshot.data as profileModel;
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
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Padding(
                  // padding: EdgeInsets.only(right: 255),
                  Text(
                    "",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: secondaryColor,
                      fontSize: 15,
                    ),
                  ),
                  // ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onTap: () => _selectDate(context),
                    readOnly: true,
                    controller: dateOfBirthController,
                    decoration: const InputDecoration(
                      hintText: "Select date of Vehicle Theft",
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
                  SizedBox(
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
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // FirebaseAuth.instance.signOut();
                      // Get.to(const SplashScreen());
                      profileModel model = profileModel(
                        uid: _profileController.getCurrentUserUid(),
                        fullname: fullnameController.text,
                        email: emailController.text,
                        phoneNo: phoneController.text,
                        password: passwordController.text,
                        residence: residcenceController.text,
                        gender: dropdownController.text,
                        cnic: cnicController.text,
                        dateofBirth: dateOfBirthController.text,
                        profileImage: user.profileImage.toString(),
                      );

                      _profileController.updateUserRecord(model);
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
                  SizedBox(
                    height: 100,
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
