// ignore: file_names
import 'package:flutter/material.dart';
import 'package:untitled/View/First%20Aid%20Guide/textformat.dart';

import '../../src/Constants/colors.dart';
import '../../src/Constants/text_strings.dart';
import '../../src/Utils/CommonWidgets/CustomBottomNavigationBarWithWallet.dart';
import '../../src/Utils/CommonWidgets/FloatingactionButtonWithNotched.dart';

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
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
      body: Column(
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
          Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
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
                  child: Text(
                    "COVID-19 PRECAUTIONS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: secondaryColor),
                ),
              )),
          Padding(
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
                          heading3: "3.	Quarantine and Isolation Procedures: ",
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
        ],
      ),
    );
  }
}
