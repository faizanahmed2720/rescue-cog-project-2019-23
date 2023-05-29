// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Patient/User%20Account%20Setting/user_account_setting.dart';

import '../../../src/Theme/colors.dart';

Widget driverFloatingActionButtonWithNotched() {
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
              "assets/Images/driver.png",
              height: 26,
              width: 26,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            // Get.to(const UserAccountSetting());
          }),
    ),
  );
}
