import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/User/user%20Management/userSignUp_screen.dart';
import 'package:untitled/src/Constants/text_strings.dart';

import '../../../src/Constants/colors.dart';
import '../../../src/Utils/CommonWidgets/customTextField.dart';

class userLogin extends StatefulWidget {
  const userLogin({super.key});

  @override
  State<userLogin> createState() => _userLoginState();
}

class _userLoginState extends State<userLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.password,
                  placeholder: 'PASSWORD',
                  secureText: true,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                SizedBox(
                  height: 140,
                ),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(userSignup());
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
