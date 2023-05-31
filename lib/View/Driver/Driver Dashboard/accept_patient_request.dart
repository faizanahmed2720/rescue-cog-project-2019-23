import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

import '../../../src/Theme/colors.dart';
import '../commonWidgets/customBottomNavigationBar.dart';
import '../commonWidgets/customFloatingActionButton.dart';
import 'best_route_hospital.dart';

class acceptPatientRequest extends StatefulWidget {
  const acceptPatientRequest({Key? key}) : super(key: key);

  @override
  State<acceptPatientRequest> createState() => _acceptPatientRequestState();
}

class _acceptPatientRequestState extends State<acceptPatientRequest> {
  final Set<Marker> _markers = {};
  LatLng _initialCameraPosition = const LatLng(31.5204, 74.3587); // Lahore LatLng

  void _addMarker(LatLng position, String title) {
    final Marker marker = Marker(
      markerId: MarkerId(title),
      position: position,
      infoWindow: InfoWindow(
        title: title,
      ),
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _addMarkers() {

    _addMarker(const LatLng(33.9930, 71.4402), 'Shaukat Khanum');
    _addMarker(const LatLng(31.4846, 74.2974), 'Jinnah Hospital');
    _addMarker(const LatLng(31.4797, 74.2804), 'Doctors Hospital');
    _addMarker(const LatLng(31.4846, 74.3974), 'National Hospital');
    _addMarker(const LatLng(31.5382, 74.3362), 'Punjab Institute of Cardiology');
    _addMarker(const LatLng(31.4756, 74.3377), 'Ittefaq Hospital');
    _addMarker(const LatLng(31.5753, 74.3798), 'Shalamar Hospital');
    _addMarker(const LatLng(31.5708, 74.3152), 'Mayo Hospital');
    _addMarker(const LatLng(31.5119, 74.3283), 'Hameed Latif Hospital');
    _addMarker(const LatLng(31.5127, 74.2996), 'Farooq Hospital');
    _addMarker(const LatLng(31.5356, 74.3273), 'Fatima Memorial Hospital');
    _addMarker(const LatLng(31.5380, 74.3513), 'Surgimed Hospital');
    _addMarker(const LatLng(31.3361, 74.1985), 'Sharif Medical City Hospital');
    _addMarker(const LatLng(31.5082, 74.3086), 'Sheikh Zayed Hospital');
  }
  void openCallApp() async {
    const phoneNumber = '1234567890'; // Replace with the desired phone number
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void openMessageApp() async {
    const phoneNumber = '1234567890'; // Replace with the desired phone number
    final url = 'sms:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

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
              "PATIENT LOCATION",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialCameraPosition,
                zoom: 12.0,
              ),
              markers: _markers,
              onTap: (latlang)
              {
                print("Hello");
              },
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    Get.to(bestRouteToHospital());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: secondaryColor),
                  child: Text(
                    "best route to hospital".toUpperCase(),
                    style:
                    const TextStyle(fontSize: 15),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){UrlLauncher.launch('tel://03161443588');}, icon: Image.asset("assets/Images/callIcon.png")),
                      IconButton(onPressed: (){UrlLauncher.launch('sms://03161443588');}, icon: Image.asset("assets/Images/messageIcon.png"))
                    ],
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
