// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/User/user%20Management/userLogIn_screen.dart';
import 'package:untitled/View/home_screen/get_started.dart';
import 'package:untitled/src/Constants/colors.dart';
import 'package:untitled/src/Controller/auth_controller.dart';
import 'package:untitled/src/Utils/CommonWidgets/customTextField.dart';
import 'package:untitled/src/Utils/CommonWidgets/snackbar_widget.dart';
import 'package:untitled/src/Utils/Regex/regex.dart';

import '../../../src/Controller/profile_controller.dart';

class userSignup extends StatefulWidget {
  const userSignup({super.key});

  @override
  State<userSignup> createState() => _userSignupState();
}

class _userSignupState extends State<userSignup> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  final _profileController = Get.put(profileController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: Column(
                children: [
                  Form(
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
                        ],
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        //used for user signup,
                        if (_formKey.currentState!.validate()) {
                          try {
                            profileModel user;
                            UserCredential? userCredential =
                                await _authController
                                    .createAccount(
                                      emailController.text,
                                      passwordController.text,
                                      phoneController.text,
                                      // fullnameController.text,
                                      // 'user',
                                    )
                                    .whenComplete(() => {
                                          user = profileModel(
                                              uid: _profileController
                                                  .getCurrentUserUid(),
                                              fullname: fullnameController.text
                                                  .trim(),
                                              email:
                                                  emailController.text.trim(),
                                              phoneNo:
                                                  phoneController.text.trim(),
                                              password: passwordController.text
                                                  .trim(),
                                              residence: "",
                                              gender: "",
                                              cnic: "",
                                              dateofBirth: "",
                                              profileImage: ""),
                                          _profileController.createUser(user)
                                        });
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
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                          Get.to(const UserLogin());
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
          ],
        ),
      ),
    );
  }
}
