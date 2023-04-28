// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../src/Constants/colors.dart';
import '../Driver/driver Management/driverSignup_screen.dart';
import '../First Aid Guide/first_aid _guide.dart';
import '../Request Ambulance/request_ambulance_screen.dart';

// ignore: camel_case_types
class userDashboard extends StatelessWidget {
  const userDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/Dashboard/background.png"),
                    fit: BoxFit.cover)),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(42, 159, 0, 0),
                child: SizedBox(
                  height: 115,
                  width: 125,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const requestAmbulance());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        // backgroundColor: Colors.transparent,
                        // elevation: 0,
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(42, 55, 0, 0),
                child: SizedBox(
                  height: 115,
                  width: 125,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const firstAidGuide());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        // backgroundColor: Colors.transparent,
                        // elevation: 0,
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 55, 0, 0),
                child: SizedBox(
                  height: 115,
                  width: 125,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const firstAidGuide());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                        // backgroundColor: Colors.transparent,
                        // elevation: 0,
                      ),
                      child: const Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      )),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
