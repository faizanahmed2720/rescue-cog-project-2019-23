import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Patient/Emergency/call_ambulance.dart';
import 'package:untitled/View/Patient/Request%20Ambulance/map_screen.dart';
import 'package:uuid/uuid.dart';
import '../../../models/request_ambulance_model.dart';
import '../../../src/Controller/profile_controller.dart';
import '../../../src/Controller/user_Ambulance_request_Controller.dart';
import '../../../src/Theme/colors.dart';

class EmergencyFindDriver extends StatefulWidget {
  String source;
  String destination;

  EmergencyFindDriver({super.key, required this.source, required this.destination});

  @override
  State<EmergencyFindDriver> createState() => _EmergencyFindDriverState();
}

class _EmergencyFindDriverState extends State<EmergencyFindDriver> {
  final profileController _profileController = Get.put(profileController());
  final UserRequestAmbulanceController _requestAmbulanceController =
  Get.put(UserRequestAmbulanceController());

  profileModel user =
  profileModel(fullname: '', email: '', phoneNo: '', password: '');

  Future get() async {
    user = (await _requestAmbulanceController.getUserDetails());
  }

  @override
  void initState() {
    // TODO: implement initState
    get();
    super.initState();
  }

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
                            itemCount: snapshot.data!.length,
                            physics: const ClampingScrollPhysics(),
                            reverse: true,
                            itemBuilder: (context, index) {
                              // if(snapshot.data![index].profileImage != null && snapshot.data![index].profileImage!.isNotEmpty ){
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: primaryColor, // Border color
                                      width: 2.0, // Border width
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        15.0), // Border radius
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
                                            child: snapshot.data![index]
                                                .profileImage !=
                                                null &&
                                                snapshot
                                                    .data![index]
                                                    .profileImage!
                                                    .isNotEmpty
                                                ? Image.network(
                                                '${snapshot.data![index].profileImage}')
                                                : const Icon(Icons.person)),
                                        title: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].fullname,
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
                                            ),
                                            Text(
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Divider(
                                            color: thirdColor, thickness: 2),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            RequestAmbulanceModel request =
                                            RequestAmbulanceModel(
                                                source: widget.source,
                                                destination:
                                                widget.destination,
                                                fullName: user.fullname,
                                                profileImage:
                                                user.profileImage,
                                                phoneNo: user.phoneNo,
                                                requestId: uuid.v4()
                                            );

                                            await _requestAmbulanceController
                                                .createRequest(
                                                request,
                                                snapshot.data![index].uid
                                                    .toString())
                                                .then((value) => {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CallAmbulance(fullName: snapshot.data![index].fullname, vehicleNo: snapshot.data![index].vehicleNumber,profileImage: snapshot.data![index].profileImage,vehicleType: snapshot.data![index].vehicleType,)),
                                              )
                                            });
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty.all<
                                                  Color>(Colors.red)),
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
