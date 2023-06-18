import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/Constants/text_strings.dart';
import '../../../src/Theme/colors.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingactionButton.dart';
import '../commonWidgets/customBottomNavigationBar.dart';
import '../commonWidgets/customFloatingActionButton.dart';

class DriverAbout extends StatelessWidget {
  const DriverAbout({Key? key}) : super(key: key);

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
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 150,
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
                "ABOUT".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(driverAbout, style: TextStyle(fontSize: 15),),

            ),
          ],
        ),
      ),
    );
  }
}
