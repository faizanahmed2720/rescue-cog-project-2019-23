import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/src/Theme/colors.dart';
import '../commonWidgets/customBottomNavigationBar.dart';
import '../commonWidgets/customFloatingActionButton.dart';
import 'accept_patient_request.dart';

class driverDashboard extends StatelessWidget {
  const driverDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: driverCustomBottomNavigationBar(),
      floatingActionButton: driverFloatingActionButtonWithNotched(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      body: Stack(
        children: [
          Image.asset(
            "assets/Images/Dashboard/background.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/Images/logo.png",
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: 330,
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "PATIENT REQUEST",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    color: primaryColor,
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.52,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (c, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(28, 10, 25, 0),
                            child: Container(
                              height: 185,
                              alignment: Alignment.center,
                              width: 250,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: thirdColor,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            width: 90,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.yellow,
                                                  width: 3.0,
                                                  style: BorderStyle.solid),
                                            ),
                                            child: const ClipOval(
                                                child: Icon(
                                              Icons.person,
                                              size: 80,
                                              color: primaryColor,
                                            )),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Name: Faizan Ahmed",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Phone: 03214789352",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Location: Shadara",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Destination: USA",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 130,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                primary: secondaryColor),
                                            child: Text(
                                              "Decline".toUpperCase(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 130,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(const PatientLocation());
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: secondaryColor),
                                            child: Text(
                                              "Accept".toUpperCase(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
