import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/Driver%20Dashboard/driver_nearest_hospital.dart';
import 'package:untitled/src/Theme/colors.dart';
import '../../../src/Controller/driver_request_controller.dart';
import '../commonWidgets/customBottomNavigationBar.dart';
import '../commonWidgets/customFloatingActionButton.dart';
import 'accept_patient_request.dart';

class driverDashboard extends StatefulWidget {
  const driverDashboard({Key? key}) : super(key: key);

  @override
  State<driverDashboard> createState() => _driverDashboardState();
}

class _driverDashboardState extends State<driverDashboard> {

  final DriverRequestController _diverRequestController = Get.put(DriverRequestController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverRequestController>(builder: (_){
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
                      color: primaryColor,
                      child: const Align(
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
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.84,
                        child: FutureBuilder(
                            future: _diverRequestController.getAllUserdetail(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: snapshot.data!.length,
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
                                                    MainAxisAlignment.start,
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
                                                        // Container(
                                                        //   width: 50,
                                                        //   height: 50,
                                                        //   decoration: BoxDecoration(
                                                        //     shape: BoxShape.circle,
                                                        //     color: Colors.blue,
                                                        //   ),
                                                        //   child: FutureBuilder<List<YourDataType>>(
                                                        //     future: fetchDataFromDatabase(), // Replace fetchDataFromDatabase() with your actual function to retrieve data from the database
                                                        //     builder: (context, snapshot) {
                                                        //       if (snapshot.connectionState == ConnectionState.waiting) {
                                                        //         return CircularProgressIndicator(); // Display a loading indicator while data is being fetched
                                                        //       } else if (snapshot.hasError) {
                                                        //         return Icon(Icons.error); // Display an error icon if there's an error in fetching data
                                                        //       } else {
                                                        //         if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                                                        //           return Image.network(
                                                        //             '${snapshot.data![index].profileImage}',
                                                        //           );
                                                        //         } else {
                                                        //           return Icon(Icons.person); // Display a default icon if the profile image is not available
                                                        //         }
                                                        //       }
                                                        //     },
                                                        //   ),
                                                        // ),

                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children:  [
                                                            Text(
                                                              snapshot.data![index].fullName.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white),
                                                            ),
                                                            Text(
                                                              snapshot.data![index].phoneNo.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white),
                                                            ),
                                                            Text(
                                                              snapshot.data![index].source.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white),
                                                            ),
                                                            Text(
                                                              snapshot.data![index].destination.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white),
                                                            ),
                                                          ],
                                                        ),
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
                                                          onPressed: () {
                                                            _diverRequestController.declineRequest(snapshot.data![index].requestId.toString());
                                                            setState(() {
                                                            });
                                                          },
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
                                                            Get.to( PatientLocation(destination:  snapshot.data![index].source.toString(),));
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
                                      });
                                } else if (snapshot.hasError) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DriverNearestHospital()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: thirdColor, // Set the background color of the button
                          padding: EdgeInsets.symmetric(vertical: 10),
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "NEAREST HOSPITAL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    );
  }
}
