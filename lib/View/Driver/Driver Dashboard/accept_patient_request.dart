// Import required packages
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

import '../../../src/Theme/colors.dart';
import '../commonWidgets/customBottomNavigationBar.dart';
import '../commonWidgets/customFloatingActionButton.dart';
import 'best_route_hospital.dart';

class PatientLocation extends StatefulWidget {
  String destination;

  PatientLocation({Key? key, required this.destination}) : super(key: key);

  @override
  State<PatientLocation> createState() => _PatientLocationState();
}

class _PatientLocationState extends State<PatientLocation> {
  Set<Marker> _markers = {};
  LatLng _initialCameraPosition = const LatLng(31.5204, 74.3587); // Lahore LatLng
  late GoogleMapController _mapController;

  double? sourceLatitude;
  double? sourceLongitude;

  String? destinationLatitude;
  String? destinationLongitude;
  Set<Polyline> _polylines = {};

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

  void _addMarkers() async {
    if (widget.destination != null && widget.destination.length >= 20) {
      String destinationLatitude = widget.destination.substring(0, 9);
      String destinationLongitude = widget.destination.substring(10, 20);

      Position position = await Geolocator.getCurrentPosition();
      sourceLatitude = position.latitude;
      sourceLongitude = position.longitude;

      _addMarker(LatLng(sourceLatitude!, sourceLongitude!), 'Source');
      _addMarker(LatLng(double.parse(destinationLatitude), double.parse(destinationLongitude)), 'Destination',);
      // _addMarker(const LatLng(31.4797, 74.2804), 'Doctors Hospital');

      _addPolyline();
    }
  }

  void _addPolyline() {
    Polyline polyline = Polyline(
      polylineId: PolylineId('route'),
      color: Colors.blue,
      width: 5,
      points: [
        LatLng(sourceLatitude!, sourceLongitude!),
        LatLng(double.parse(destinationLatitude!), double.parse(destinationLongitude!)),
        // LatLng(31.4797, 74.2804),
    ],
    );

    setState(() {
      _polylines.add(polyline);
    });
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
    _addMarkers();
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
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: driverCustomBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: driverFloatingActionButtonWithNotched(),
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
            height: MediaQuery.of(context).size.height / 2,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialCameraPosition,
                zoom: 12.0,
              ),
              markers: _markers,
              polylines: _polylines, // Add polylines to the map
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              onTap: (latlang) {
                print("Hello");
              },
            ),
          ),
          Expanded(
            child: Container(
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
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const bestRouteToHospital());
                    },
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: Text(
                      "best route to hospital".toUpperCase(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            UrlLauncher.launch('tel://03161443588');
                          },
                          icon: Image.asset("assets/Images/callIcon.png"),
                        ),
                        IconButton(
                          onPressed: () {
                            UrlLauncher.launch('sms://03161443588');
                          },
                          icon: Image.asset("assets/Images/messageIcon.png"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
