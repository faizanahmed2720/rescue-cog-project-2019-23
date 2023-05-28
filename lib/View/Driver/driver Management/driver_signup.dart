import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Utils/Regex/regex.dart';
import '../../../src/Theme/colors.dart';
import '../../../src/Controller/auth_controller.dart';
import '../../../src/Utils/CommonWidgets/customTextField.dart';
import '../../../src/Utils/CommonWidgets/snackbar_widget.dart';
import '../../Patient/home_screen/get_started.dart';
import 'driverLogin_screen.dart';

class DriverSignupPage extends StatelessWidget {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  final List<String> vehicleTypes = [
    'Suzuki Bolan',
    'Changhan',
    'Kinglong Van'
  ];

  final AuthController _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  DriverSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
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
                "SIGNUP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 20,
                right: 30,
                bottom: 0,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: fullnameController,
                        icon: Icons.person,
                        placeholder: 'FULLNAME',
                        secureText: false,
                        type: TextInputType.text,
                        validator: (val) {
                          if (val!.isValidName == false)
                            return 'Enter valid Name';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        placeholder: 'EMAIL',
                        secureText: false,
                        type: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isValidEmail == false)
                            return 'Enter valid email';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: phoneController,
                        icon: Icons.phone,
                        placeholder: 'PHONE',
                        secureText: false,
                        type: TextInputType.number,
                        validator: (val) {
                          if (val!.isValidPhone == false)
                            return 'Enter valid Phone';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: cnicController,
                        icon: Icons.quick_contacts_dialer_sharp,
                        placeholder: 'CNIC',
                        secureText: false,
                        type: TextInputType.number,
                        validator: (val) {
                          if (val!.isValidCnicNumber == false)
                            return 'Enter valid CNIC';
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        value: dropdownController.text.isNotEmpty
                            ? dropdownController.text
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
                          dropdownController.text = value!;
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
                        placeholder: 'PASSWORD',
                        secureText: true,
                        type: TextInputType.text,
                        validator: (val) {
                          if (passwordController.toString().isEmpty) {
                            return 'Please enter some text';
                          }
                          if (val!.isValidPassword == false)
                            return ' Password should contain A,a ,123';
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              //used for driver signup,
                              try {
                                UserCredential? userCredential =
                                await _authController.createAccount(
                                  emailController.text,
                                  passwordController.text,
                                  // phoneController.text,
                                  // fullNameController.text,
                                  // 'driver',
                                );
                                //if user crdential is null then there must be an exception.
                                if (userCredential != null) {
                                  // ignore: use_build_context_synchronously
                                  showSnackBar(
                                    "Signup Successful",
                                    context,
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => const get_started(),
                                    ),
                                        (route) => false,
                                  );
                                } else {
                                  // ignore: use_build_context_synchronously
                                  showSnackBar(
                                    "Login failed",
                                    context,
                                  );
                                }
                              } catch (e) {
                                //e will tell us the value of exception
                                showSnackBar(
                                  e.toString(),
                                  context,
                                );
                              }
                            }
                          },
                          style:
                          ElevatedButton.styleFrom(primary: secondaryColor),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Text(
                              "SIGNUP",
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(const DriverLogin());
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
