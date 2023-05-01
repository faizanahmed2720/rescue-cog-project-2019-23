// ignore: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/First%20Aid%20Guide/disease_1.dart';
import 'package:untitled/View/First%20Aid%20Guide/disease_3.dart';
import 'package:untitled/View/First%20Aid%20Guide/disease_4.dart';
import 'package:untitled/View/First%20Aid%20Guide/disease_5.dart';
import 'package:untitled/View/First%20Aid%20Guide/disease_6.dart';
import 'package:untitled/src/Constants/colors.dart';

import 'disease_2.dart';

class FirstAidGuide extends StatefulWidget {
  const FirstAidGuide({super.key});

  @override
  State<FirstAidGuide> createState() => _FirstAidGuideState();
}

class _FirstAidGuideState extends State<FirstAidGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: primaryColor,
              ),
              child: const Text(
                "FIND THE GUIDE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Disease1());
                      },
                      child: const Text(
                        "COVID-19 Precautions",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Disease2());
                      },
                      child: const Text(
                        "Monkey Pox Precautions",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Disease3());
                      },
                      child: const Text(
                        "Fever Precautions",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Disease4());
                      },
                      child: const Text(
                        "Heart Attack Precautions",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Disease5());
                      },
                      child: const Text(
                        "Epilepsy Precautions",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(const Disease6());
                      },
                      child: const Text(
                        "Cough & Mild Precautions",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: secondaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
