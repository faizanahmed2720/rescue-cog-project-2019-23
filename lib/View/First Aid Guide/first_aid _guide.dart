// ignore: file_names
import 'package:flutter/material.dart';

import '../../src/Constants/colors.dart';
import '../../src/Constants/text_strings.dart';
import '../../src/Utils/CommonWidgets/CustomBottomNavigationBarWithWallet.dart';
import '../../src/Utils/CommonWidgets/FloatingactionButtonWithNotched.dart';

class FirstAidGuide extends StatelessWidget {
  final List<Map<String, String>> buttonData = [
    {
      'title': 'COVID-19 Precautions',
      'image': 'assets/Images/First Aid Guide/Banner1.png',
      'description': Button1description,
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
          Expanded(
            child: ListView.builder(
              itemCount: buttonData.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                title: buttonData[index]['title']!,
                                image: buttonData[index]['image']!,
                                description: buttonData[index]['description']!,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          buttonData[index]['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style:
                            ElevatedButton.styleFrom(primary: secondaryColor),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  const DetailScreen(
      {required this.title, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            image,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
