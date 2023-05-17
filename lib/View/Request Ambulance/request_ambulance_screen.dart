import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/Constants/colors.dart';
import '../../src/Controller/profile_controller.dart';
import 'map.dart';

class RequestAmbulance extends StatefulWidget {
  const RequestAmbulance({super.key});

  @override
  State<RequestAmbulance> createState() => _RequestAmbulanceState();
}

class _RequestAmbulanceState extends State<RequestAmbulance> {
  final profileController _profileController = Get.put(profileController());

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
            child: Text(
              "FIND THE DRIVER",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
              future: _profileController.getAllUserdetail(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        physics: ClampingScrollPhysics(),
                        reverse: true,
                        itemBuilder: (c, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ListTile(
                                  title:
                                      Text("${snapshot.data![index].fullname}"),
                                  subtitle: Text(
                                      "${snapshot.data![index].vehicleNumber}"),
                                  onTap: () {
                                    Get.to(Rescue_Map());
                                  },
                                  textColor: Colors.black,
                                  leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[700],
                                        border: Border.all(
                                            color: Colors.white,
                                            width: 5.0,
                                            style: BorderStyle.solid),
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          "${snapshot.data![index].profileImage}",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                  trailing:
                                      CircleAvatar(child: Icon(Icons.star)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    ));
  }
}
