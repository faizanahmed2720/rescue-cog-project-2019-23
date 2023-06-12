import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Patient/Request%20Ambulance/map.dart';
import '../../../src/Controller/profile_controller.dart';
import '../../../src/Theme/colors.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingactionButton.dart';

class FindDriver extends StatefulWidget {
  const FindDriver({super.key});

  @override
  State<FindDriver> createState() => _FindDriverState();
}

class _FindDriverState extends State<FindDriver> {
  final profileController _profileController = Get.put(profileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: CustomNavigationBar(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButtonWithNotched(),
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
                child: const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "FIND THE DRIVER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: _profileController.getAllUserdetail(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount:  snapshot.data!.length,
                            physics: const ClampingScrollPhysics(),
                            reverse: true,
                            itemBuilder: (context, index) {
                              if(snapshot.data![index].profileImage != null && snapshot.data![index].profileImage!.isNotEmpty ){
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: primaryColor,  // Border color
                                        width: 2.0,          // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),  // Border radius
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: Image.network('${snapshot.data![index].profileImage}')
                                          ),
                                          title: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text(
                                                '${snapshot.data![index].fullname}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Vehicle #: ${snapshot.data![index].vehicleNumber}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                'Vehicle: ${snapshot.data![index].vehicleType}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),Text(
                                                'Location: ${snapshot.data![index].residence}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: thirdColor,
                                            ),
                                            child: const Icon(
                                              Icons.star,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Divider(color: thirdColor, thickness: 2),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Get.to(const Rescue_Map());
                                              Get.to(Rescue_Map());
                                            },
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                                            child: const Text(
                                              'Request Ambulance',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }else{
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: primaryColor,  // Border color
                                        width: 2.0,          // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),  // Border radius
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue,
                                              ),
                                              child: const Icon(Icons.person)
                                          ),
                                          title: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Text(
                                                '${snapshot.data![index].fullname}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Vehicle #: ${snapshot.data![index].vehicleNumber}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                'Vehicle: ${snapshot.data![index].vehicleType}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),Text(
                                                'Location: ${snapshot.data![index].residence}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: thirdColor,
                                            ),
                                            child: const Icon(
                                              Icons.star,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Divider(color: thirdColor, thickness: 2,),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(const Rescue_Map());
                                            },
                                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                                            child: const Text(
                                              'Request Ambulance',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
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
                  }),
            ],
          ),
        ));
  }
}
