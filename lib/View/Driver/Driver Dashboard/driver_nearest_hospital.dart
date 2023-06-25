import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/View/Driver/commonWidgets/customBottomNavigationBar.dart';
import 'package:untitled/View/Driver/commonWidgets/customFloatingActionButton.dart';
import 'package:untitled/src/Theme/colors.dart';

class DriverNearestHospital extends StatefulWidget {
  @override
  _DriverNearestHospitalState createState() => _DriverNearestHospitalState();
}

class _DriverNearestHospitalState extends State<DriverNearestHospital> {
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

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded,),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: driverCustomBottomNavigationBar(),
      floatingActionButton: driverFloatingActionButtonWithNotched(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _initialCameraPosition,
              zoom: 12.0,
            ),
            markers: _markers,
            onTap: (latlang) {
              print("Hello");
            },
          ),
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: const Text(
                "NEAREST HOSPITAL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}