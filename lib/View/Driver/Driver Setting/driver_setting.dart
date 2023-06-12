import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/Driver%20Profile/driver_profile.dart';
import '../../../src/Controller/driver_controller.dart';
import '../../../src/Controller/profile_controller.dart';
import '../../../src/Theme/colors.dart';
import '../../Patient/User Profile/about.dart';
import '../../Patient/splash_screen/splash_screen.dart';
import '../Models/driverModel.dart';
import '../commonWidgets/customBottomNavigationBar.dart';
import '../commonWidgets/customFloatingActionButton.dart';

class driverSetting extends StatefulWidget {
  const driverSetting({super.key});

  @override
  State<driverSetting> createState() => _driverSettingState();
}

class _driverSettingState extends State<driverSetting> {
  final driverController _driverController = Get.put(driverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: driverCustomBottomNavigationBar(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: driverFloatingActionButtonWithNotched(),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 250,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      color: primaryColor,
                    ),
                    child: Text(
                      "SETTING".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 180,
                      ),
                      FutureBuilder(
                        future: _driverController.getUserDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasData) {
                              driverModel userData = snapshot.data as driverModel;
                              if(userData.profileImage != null && userData.profileImage!.isNotEmpty ) {
                                return Column(
                                  children: [
                                    Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[700],
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 5.0,
                                              style: BorderStyle.solid),
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            userData.profileImage!,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          Text(
                                            userData.fullname,
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: 'Roboto'),
                                          ),
                                          Text(
                                            userData.email,
                                            style: const TextStyle(
                                                fontSize: 16, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }else {
                                return Column(
                                  children: [
                                    Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[700],
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 5.0,
                                              style: BorderStyle.solid),
                                        ),
                                        child: ClipOval(
                                          child: Icon (Icons.person, size: 120, color: Colors.white,),
                                        )),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          Text(
                                            userData.fullname,
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: 'Roboto'),
                                          ),
                                          Text(
                                            userData.email,
                                            style: const TextStyle(
                                                fontSize: 16, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Center(child: Text(snapshot.error.toString()));
                            } else {
                              return Center(child: Text(snapshot.error.toString()));
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      const Divider(),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 70,
                        width: 450,
                        child: IconButton(onPressed: () {
                          Get.to(const driverProfile());
                        }, icon: Image.asset("assets/Images/editProfile.png"),),
                      ),
                      Container(
                        height: 70,
                        width: 450,
                        child: IconButton(onPressed: () {
                          Get.to(const About());
                        }, icon: Image.asset("assets/Images/about.png"),),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) => {Get.to(const SplashScreen())});
                        },
                        style: ElevatedButton.styleFrom(primary: secondaryColor),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            "LOGOUT".toUpperCase(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),

                ]),
              ],
            )));
  }
}
