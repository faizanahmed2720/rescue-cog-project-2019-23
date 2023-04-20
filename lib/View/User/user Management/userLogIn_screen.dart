import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/driver%20Management/driverSignup_screen.dart';
import 'package:untitled/View/User/user%20Management/userSignUp_screen.dart';
import 'package:untitled/View/home_screen/get_started.dart';
import 'package:untitled/src/Controller/auth_controller.dart';

import '../../../src/Constants/colors.dart';
import '../../../src/Utils/CommonWidgets/customTextField.dart';
import '../../User Dashboard/userDashoard_screen.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/log_in.png"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 320, 30, 0),
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
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential? userCredential = await _authController
                            .signInUser(
                              emailController.text,
                              passwordController.text,
                            )
                            .then((value) => Get.to(const userDashboard()));
                        if (userCredential != null) {
                          Get.snackbar('success', "Login Successfully");
                          // ignore: use_build_context_synchronously
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
                const SizedBox(
                  height: 140,
                ),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const userSignup());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        // backgroundColor: Colors.transparent,
                        // elevation: 0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
