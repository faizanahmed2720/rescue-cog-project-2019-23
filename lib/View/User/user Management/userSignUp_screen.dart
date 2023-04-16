import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/User/user%20Management/userLogIn_screen.dart';

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
                SizedBox(
                  height: 40,
                ),
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
                  controller: phoneController,
                  icon: Icons.phone,
                  placeholder: 'PHONE',
                  secureText: false,
                  type: TextInputType.number,
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
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: Text(
                        "SIGNUP",
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
                        Get.to(userLogin());
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
