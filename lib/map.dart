import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final Set<Marker> _markers = {};
  LatLng _initialCameraPosition = LatLng(31.5204, 74.3587); // Lahore LatLng

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
    _addMarker(LatLng(31.5133, 74.3443), 'Hospital 1');
    _addMarker(LatLng(31.5067, 74.3467), 'Hospital 2');
    _addMarker(LatLng(31.5371, 74.3304), 'Hospital 3');
    _addMarker(LatLng(31.5215, 74.3380), 'Hospital 4');
  }

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialCameraPosition,
          zoom: 12.0,
        ),
        markers: _markers,
      ),
    );
  }
}
