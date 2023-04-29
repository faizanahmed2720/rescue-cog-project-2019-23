// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Controller/auth_controller.dart';
import 'package:untitled/src/Utils/CommonWidgets/customTextField.dart';

import '../../src/Constants/colors.dart';
import '../splash_screen/splash_screen.dart';

class UserAccountSetting extends StatefulWidget {
  const UserAccountSetting({super.key});

  @override
  State<UserAccountSetting> createState() => _UserAccountSettingState();
}

class _UserAccountSettingState extends State<UserAccountSetting> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController residcenceController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  TextEditingController dropdownController = TextEditingController();
  final List<String> genderTypes = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
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
                      // icon: Icon(Icons.gender),
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    icon: Icons.calendar_month,
                    placeholder: 'DATE OF BIRTH',
                    secureText: false,
                    type: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.to(const SplashScreen());
                    },
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
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
