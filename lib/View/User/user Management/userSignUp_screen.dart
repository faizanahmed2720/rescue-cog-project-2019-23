import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/Driver/driver%20Management/driverSignup_screen.dart';
import 'package:untitled/View/User/user%20Management/userLogIn_screen.dart';
import 'package:untitled/View/home_screen/get_started.dart';
import 'package:untitled/src/Controller/auth_controller.dart';

import '../../../src/Constants/colors.dart';
import '../../../src/Utils/CommonWidgets/customTextField.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/sign_up.png"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 320, 30, 0),
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
                  height: 40,
                ),
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
                  controller: phoneController,
                  icon: Icons.phone,
                  placeholder: 'PHONE',
                  secureText: false,
                  type: TextInputType.number,
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
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      //used for user signup,
                      try {
                        UserCredential? userCredential =
                            await _authController.createAccount(
                          emailController.text,
                          passwordController.text,
                          phoneController.text,
                          fullnameController.text,
                          'user',
                        );
                        //if user crdential is null then there must be an exception.
                        if (userCredential != null) {
                          showSnackBar(
                            "Signup Successful",
                            context,
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const get_started(),
                            ),
                            (route) => false,
                          );
                        } else {
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
                    },
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Text(
                        "SIGNUP",
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
                        Get.to(const UserLogin());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        // backgroundColor: Colors.transparent,
                        // elevation: 0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "Log In",
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
