// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingactionButton.dart';
import '../First Aid Guide/first_aid _guide.dart';
import '../Nearest Hospital/nearest_hospital.dart';
import '../Request Ambulance/request_ambulance_screen.dart';
import '../User Setting/user_setting.dart';

// ignore: camel_case_types
class userDashboard extends StatelessWidget {
  const userDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButtonWithNotched(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/Images/Dashboard/background.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment. center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/Images/logo.png",
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(const RequestAmbulance());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0),
                                  child: Image.asset(
                                      "assets/Images/Dashboard/ambulance.png")),
                            ),
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(NearestHospital());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0),
                                  child: Image.asset(
                                      "assets/Images/Dashboard/hospital.png")),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(FirstAidGuide());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0),
                                  child: Image.asset(
                                      "assets/Images/Dashboard/first aid.png")),
                            ),
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(
                              height: 150,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Get.to(fireBrigades());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0),
                                  child: Image.asset(
                                      "assets/Images/Dashboard/fire brigades.png")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(const userSetting());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, elevation: 0),
                        child: Image.asset(
                            "assets/Images/Dashboard/account setting.png")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
