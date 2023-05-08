import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearestHospital extends StatefulWidget {
  const NearestHospital({super.key});

  @override
  State<NearestHospital> createState() => _NearestHospitalState();
}

class _NearestHospitalState extends State<NearestHospital> {
  var mapmarker = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Find Nearest Hospital"),
          ),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.43296265331129, -122.08832357078792),
            ),
            onMapCreated: (controller) {
              setState(() {
                mapmarker.add(Marker(
                  markerId: MarkerId(
                      "Shaukat Khanum Memorial Cancer Hospital and Research Centre"),
                  position: LatLng(31.4635, 74.2659),
                ));
              });
            },
            markers: mapmarker,
          )),
    );
  }
}
