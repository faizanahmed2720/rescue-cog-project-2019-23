import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../src/Constants/colors.dart';
import '../../src/Controller/profile_controller.dart';
import '../splash_screen/splash_screen.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  final profileController _profileController = Get.put(profileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children:[ Column(
      children: [
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
            "Profile".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
            future: _profileController.getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.done) {
                if (snapshot.hasData) {
                  profileModel userData = snapshot.data as profileModel;
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
                          )
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            userData.fullname,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto'),
                          ),

                          SizedBox(height: 30),
                          Text(
                         "EMAIL:    "+ userData.email,
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            "PHONE NO:    "+ userData.phoneNo,
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            userData.residence.toString(),
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            userData.cnic.toString(),
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            userData.gender.toString(),
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            userData.dateofBirth.toString(),
                            style: TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          Divider(),
                          SizedBox(height: 40),

                          ElevatedButton(onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Get.to(const SplashScreen());
                          }, style: ElevatedButton.styleFrom(primary: secondaryColor),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Text(
                                "LOGOUT".toUpperCase(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),


                        ],
              ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(snapshot.error.toString())
                  );
                } else {
                  return  Center(
                    child: Text(snapshot.error.toString())
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ]),
        ],
      ),
    ));
  }
}
