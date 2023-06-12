import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../src/Theme/colors.dart';
import '../../Driver/driver Management/driverLogin_screen.dart';
import '../user Management/emergency.dart';
import '../user Management/userLogIn_screen.dart';

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
        padding: const EdgeInsets.fromLTRB(80, 500, 0, 0),
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(Emergency());
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                child: const Text(
                  "Emergency",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 620, 0, 0),
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const UserLogin());
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                child: const Text(
                  "LogIn as a User",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 690, 0, 0),
        child: SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(const DriverLogin());
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                child: const Text(
                  "LogIn as a Driver",
                  style: TextStyle(fontSize: 20),
                ))),
      ),
    ]));
  }
}
