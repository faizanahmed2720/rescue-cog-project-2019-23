import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import '../../src/Constants/colors.dart';
import '../home_screen/get_started.dart';

class permissionScreen extends StatefulWidget {
  const permissionScreen({super.key});

  @override
  State<permissionScreen> createState() => _permissionScreenState();
}

class _permissionScreenState extends State<permissionScreen> {
  Future<void> requestPermissions() async {
    // Request location permission
    var locationStatus = await Permission.location.request();

    if (locationStatus.isDenied) {
      // Location permission denied
      return;
    }

    // Request call permission
    var callStatus = await Permission.phone.request();
    if (callStatus.isDenied) {
      // Call permission denied
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Images/give_permission.png"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(90, 550, 0, 0),
          child: SizedBox(
              height: 40,
              width: 180,
              child: ElevatedButton(
                  onPressed: () {
                    requestPermissions()
                        .then((value) => {Get.to(const get_started())});
                    // Code to access location and make call goes here
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 20),
                  ))),
        )
      ]),
    );
  }
}
