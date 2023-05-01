// ignore: file_names

import 'package:flutter/material.dart';
import 'package:untitled/src/Constants/colors.dart';

class Disease1 extends StatefulWidget {
  const Disease1({super.key});

  @override
  State<Disease1> createState() => _Disease1State();
}

class _Disease1State extends State<Disease1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                child: const Center(
                  child: Text(
                    "     COVID-19 \n PRECAUTIONS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child:
                        Image.asset("assets/Images/First Aid Guide/Doctor.gif"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
