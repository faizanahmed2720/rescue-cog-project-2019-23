import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../src/Constants/colors.dart';
import '../Driver/driver Management/driverLogin_screen.dart';
import '../User/user Management/userLogIn_screen.dart';

class get_started extends StatefulWidget {
  const get_started({super.key});

  @override
  State<get_started> createState() => _get_startedState();
}

class _get_startedState extends State<get_started> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Images/get_started.png"),
                fit: BoxFit.cover)),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 470, 0, 0),
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: secondaryColor),
                child: Text(
                  "Emergency",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 600, 0, 0),
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(UserLogin());
                },
                style: ElevatedButton.styleFrom(primary: secondaryColor),
                child: Text(
                  "LogIn as a User",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 670, 0, 0),
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(DriverLogin());
                },
                style: ElevatedButton.styleFrom(primary: secondaryColor),
                child: Text(
                  "LogIn as a Driver",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
    ]));
  }
}
