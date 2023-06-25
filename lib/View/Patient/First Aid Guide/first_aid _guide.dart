// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Patient/First%20Aid%20Guide/textformat.dart';
import 'package:untitled/View/Patient/User%20Profile/first_aid_video.dart';
import 'package:untitled/src/Constants/text_strings.dart';
import 'package:untitled/src/Utils/CommonWidgets/UserFloatingactionButton.dart';

import '../../../src/Theme/colors.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';

class FirstAidGuide extends StatelessWidget {
  final List<Map<String, String>> buttonData = [
    {
      'title': 'COVID-19 Precautions',
      'image': 'assets/Images/First Aid Guide/Banner1.png',
      'description': "This is the description for button 1",
    },
    {
      'title': 'Monkey Pox Precautions',
      'image': 'assets/images/Curves/topCurve.png',
      'description': 'This is the description for button 2',
    },
    {
      'title': 'Fever Precautions',
      'image': 'assets/images/Curves/topCurve.png',
      'description': 'This is the description for button 3',
    },
    {
      'title': 'Heart Attack Precautions',
      'image': 'path/to/image4.jpg',
      'description': 'This is the description for button 4',
    },
    {
      'title': 'Epilepsy Precautions',
      'image': 'path/to/image5.jpg',
      'description': 'This is the description for button 5',
    },
    {
      'title': 'Cough & Mild Precautions',
      'image': 'path/to/image6.jpg',
      'description': 'This is the description for button 6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
      body: Column(
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
            child: const Text(
              "FIND THE GUIDE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFormatWidget(
                            disease: "COVID-19 PRECAUTIONS",
                            image: "assets/Images/First Aid Guide/Banner1.png",
                            heading1:
                                "Keep yourself and others safe: Do it all! \nProtect yourself and those around you: ",
                            heading2:
                                "Wear a mask properly to properly wear your mask: ",
                            heading3:
                                "To make your environment as safe as possible: ",
                            heading4: "To ensure good hygiene you should: ",
                            heading5: "",
                            paragraph1: Covid_p1,
                            paragraph2: Covid_p2,
                            paragraph3: Covid_p3,
                            paragraph4: Covid_p4,
                            paragraph5: Covid_p5,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: const Text(
                      "COVID-19 PRECAUTIONS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFormatWidget(
                            disease: "MONKEY POX PRECAUTIONS",
                            image: "assets/Images/First Aid Guide/Banner2.png",
                            heading1:
                                "1.	Personal Protective Measures for Monkeypox: ",
                            heading2: "2.	Environmental Sanitation: ",
                            heading3:
                                "3.	Quarantine and Isolation Procedures: ",
                            heading4: "4.	Vaccination and Treatment Options: ",
                            heading5:
                                "مونکی پوکس انفیکشن کو کیسے روکا جا سکتا ہے؟",
                            paragraph1: pox_p1,
                            paragraph2: pox_p2,
                            paragraph3: pox_p3,
                            paragraph4: pox_p4,
                            paragraph5: pox_p5,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "MONKEY POX PRECAUTIONS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                  ),
                )),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFormatWidget(
                            disease: "FEVER PRECAUTIONS",
                            image: "assets/Images/First Aid Guide/fever.png",
                            heading1: "1.	Maintain Good Hygiene Practices: ",
                            heading2:
                                "2.	Avoid Close Contact with Sick People: ",
                            heading3: "3.	Boost Your Immune System: ",
                            heading4:
                                "4.	Seek Medical Attention When Necessary: ",
                            heading5:
                                "مونکی پوکس انفیکشن کو کیسے روکا جا سکتا ہے؟",
                            paragraph1: fever_p1,
                            paragraph2: fever_p2,
                            paragraph3: fever_p3,
                            paragraph4: fever_p4,
                            paragraph5: fever_p5,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "FEVER PRECAUTIONS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                  ),
                )),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFormatWidget(
                            disease: "HEART ATTACK PRECAUTIONS",
                            image: "assets/Images/First Aid Guide/heart.png",
                            heading1: "1.	Maintain a Healthy Lifestyle: ",
                            heading2: "2.	Manage Chronic Health Conditions: ",
                            heading3:
                                "3.	Avoid Smoking and Excessive Alcohol Consumption: ",
                            heading4:
                                "4.	Recognize the Symptoms of Heart Attack: ",
                            heading5:
                                "مونکی پوکس انفیکشن کو کیسے روکا جا سکتا ہے؟",
                            paragraph1: heart_p1,
                            paragraph2: heart_p2,
                            paragraph3: heart_p3,
                            paragraph4: heart_p4,
                            paragraph5: heart_p5,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Heart attack precautions".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                  ),
                )),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFormatWidget(
                            disease: "EPILEPSY PRECAUTIONS",
                            image: "assets/Images/First Aid Guide/Epilepsy.png",
                            heading1:
                                "1.	Take Your Medications as Prescribed: ",
                            heading2: "2.	Get Enough Sleep and Manage Stress: ",
                            heading3: "3.	Avoid Triggers: ",
                            heading4: "4.	Wear a Medical Alert Bracelet",
                            heading5:
                                "مونکی پوکس انفیکشن کو کیسے روکا جا سکتا ہے؟",
                            paragraph1: epilepsy_p1,
                            paragraph2: epilepsy_p2,
                            paragraph3: epilepsy_p3,
                            paragraph4: epilepsy_p4,
                            paragraph5: epilepsy_p5,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "epilepsy precautions".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                  ),
                )),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TextFormatWidget(
                            disease: "COUGH & MILD PRECAUTIONS",
                            image: "assets/Images/First Aid Guide/cough.png",
                            heading1: "1.	Practice Good Hygiene: ",
                            heading2: "2.	Stay Home if You Are Sick: ",
                            heading3: "3.	Treat Your Symptoms: ",
                            heading4: "4.	Monitor Your Symptoms: ",
                            heading5:
                                "مونکی پوکس انفیکشن کو کیسے روکا جا سکتا ہے؟",
                            paragraph1: cough_p1,
                            paragraph2: cough_p2,
                            paragraph3: cough_p3,
                            paragraph4: cough_p4,
                            paragraph5: cough_p5,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "COUGH & MILD PRECAUTIONS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                  ),
                )),
          ),
          SizedBox(
            width: 320,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstAidVideo()),
                      );
                    },
                    child: Text(
                      "First Aid Video Guides".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
