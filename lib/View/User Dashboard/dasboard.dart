import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                "assets/Images/Dashboard/background1.png",
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 10,
                child: Container(
                  height: 2400,
                  color: Colors.white.withOpacity(0.9),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/Images/logo.png",
                        width: 250,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Image.asset(
                                    "assets/Images/Dashboard/ambulance.png"),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Image.asset(
                                    "assets/Images/Dashboard/hospital.png"),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Image.asset(
                                    "assets/Images/Dashboard/first aid.png"),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.yellow),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                                width: 50,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Image.asset(
                                    "assets/Images/Dashboard/fire brigades.png"),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //add 5th button here.
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
