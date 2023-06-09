// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Patient/User%20Profile/user_profile.dart';
import '../../Theme/colors.dart';

Widget FloatingActionButtonWithNotched() {
  return FloatingActionButton(
    heroTag: null,
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: FloatingActionButton(
          backgroundColor: primaryColor,
          hoverElevation: 10,
          foregroundColor: Colors.black54,
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              "assets/Images/Navigation Icons/profile.png",
              height: 26,
              width: 26,
            ),
          ),
          onPressed: () {
            Get.to(userProfile());
          }),
    ),
  );
}
