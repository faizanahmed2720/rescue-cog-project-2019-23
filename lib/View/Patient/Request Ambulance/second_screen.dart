import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondScreen extends StatelessWidget {
  final String sourceLocation;
  final String destinationLocation;

  SecondScreen({
    required this.sourceLocation,
    required this.destinationLocation,
  });

  @override
  Widget build(BuildContext context) {
    Set<Polyline> _polylines = {};

    LatLng sourceLatLng = _convertToLatLng(sourceLocation);
    LatLng destinationLatLng = _convertToLatLng(destinationLocation);

    _polylines.add(
      Polyline(
        polylineId: PolylineId('route'),
        points: [
          sourceLatLng,
          destinationLatLng,
        ],
        color: Colors.blue,
        width: 5,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: sourceLatLng,
          zoom: 10.0,
        ),
        polylines: _polylines,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  LatLng _convertToLatLng(String coordinates) {
    List<String> latLng = coordinates.split(', ');
    double latitude = double.parse(latLng[0]);
    double longitude = double.parse(latLng[1]);
    return LatLng(latitude, longitude);
  }
}
