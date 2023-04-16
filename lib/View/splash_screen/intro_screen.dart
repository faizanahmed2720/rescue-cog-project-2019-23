// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/View/premission_screen/permission.dart';
import 'package:get/get.dart';

import '../../src/Constants/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int screen = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 25, bottom: 40),
        child: InkWell(
          onTap: () {
            if (screen < 3) {
              setState(() {
                screen++;
              });
            } else {
              Get.to(permissionScreen());
            }
          },
          child: Icon(
            Icons.arrow_circle_right,
            size: 80,
            color: primaryColor,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: screen == 1
                    ? AssetImage("assets/Images/splash_1.png")
                    : screen == 2
                        ? AssetImage("assets/Images/splash_2.png")
                        : AssetImage("assets/Images/splash_3.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
