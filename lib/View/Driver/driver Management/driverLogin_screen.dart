// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/Driver%20Dashboard/driver_dashboard.dart';
import 'package:untitled/View/Driver/driver%20Management/driverSignup_screen.dart';
import 'package:untitled/src/Theme/colors.dart';
import 'package:untitled/src/Controller/auth_controller.dart';
import 'package:untitled/src/Utils/CommonWidgets/customTextField.dart';
import 'package:untitled/src/Utils/CommonWidgets/snackBar_widget.dart';
import 'package:untitled/src/Utils/Regex/regex.dart';
import '../../Patient/home_screen/get_started.dart';
import '../Driver Profile/driver_profile.dart';

class DriverLogin extends StatefulWidget {
  const DriverLogin({super.key});

  @override
  State<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

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
                "LOGIN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      placeholder: 'EMAIL',
                      secureText: false,
                      type: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.isValidEmail == false) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.password,
                      placeholder: 'PASSWORD',
                      secureText: true,
                      type: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter some text';
                        }
                        },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              UserCredential? userCredential =
                                  await _authController
                                      .signInUser(
                                        emailController.text,
                                        passwordController.text,
                                      )
                                      .then((value) =>
                                          Get.to(const driverDashboard()));
                              if (userCredential != null) {
                                Get.snackbar('success', "Login Successfully",
                                    backgroundColor: Colors.transparent);

                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const get_started(),
                                  ),
                                  (route) => false,
                                );
                              }
                            } catch (e) {
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
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(DriverSignup());
                          },
                          child: const Text(
                            "Sign up",
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
          ],
        ),
      ),
    );
  }
}
