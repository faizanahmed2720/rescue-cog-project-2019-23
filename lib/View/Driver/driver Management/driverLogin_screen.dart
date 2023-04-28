import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/Driver/driver%20Management/driverSignup_screen.dart';
import 'package:untitled/View/User%20Dashboard/home.dart';
import 'package:untitled/View/User/user%20Management/userSignUp_screen.dart';
import 'package:untitled/View/home_screen/get_started.dart';
import 'package:untitled/src/Constants/colors.dart';
import 'package:untitled/src/Controller/auth_controller.dart';
import 'package:untitled/src/Utils/CommonWidgets/customTextField.dart';
import 'package:untitled/src/Utils/CommonWidgets/snackbar_widget.dart';

class DriverLogin extends StatefulWidget {
  const DriverLogin({super.key});

  @override
  State<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
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
              child: Column(
                children: [
                  CustomTextField(
                    controller: emailController,
                    icon: Icons.email,
                    placeholder: 'EMAIL',
                    secureText: false,
                    type: TextInputType.emailAddress,
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
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          UserCredential? userCredential =
                              await _authController.signInUser(
                            emailController.text,
                            passwordController.text,
                          );
                          if (userCredential != null) {
                            showSnackBar(
                              "Login Successful",
                              context,
                            );
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
                      },
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
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
          ],
        ),
      ),
    );
  }
}
