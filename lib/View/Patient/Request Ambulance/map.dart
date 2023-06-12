import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:untitled/src/Constants/text_strings.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class Rescue_Map extends StatefulWidget {
  const Rescue_Map({Key? key}) : super(key: key);

  @override
  State<Rescue_Map> createState() => Rescue_MapState();
}

class Rescue_MapState extends State<Rescue_Map> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(31.5806489,74.4005833); //31.533199, 74.3766649
  static const LatLng destination = LatLng(31.5409497, 74.370683);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    },);

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(newLoc.latitude!, newLoc.longitude!,))));

      setState(() {});
    },);
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) =>
            polylineCoordinates.add(
              LatLng(point.latitude, point.longitude),
            ),
      );
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/Images/Navigation Icon/sourceLocation.png").then((icon) => {
    sourceIcon = icon
    },);

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/Images/user.png").then((icon) => {
    destinationIcon = icon
    },);

    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/Images/user.png").then((icon) => {
      currentLocationIcon = icon
    },);
  }

  @override
  void initState() {
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
              currentLocation!.latitude!, currentLocation!.longitude!),
          // zoom: 13.5,
        ),
        polylines: {
          Polyline(polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: Colors.blue,
            width: 6,
          ),
        },

        markers: {
          Marker(
            markerId: const MarkerId("currentLocation"),
            icon: currentLocationIcon,
            position: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!),
          ),
           Marker(
            markerId: const MarkerId("source"),
            icon: sourceIcon,
            position: sourceLocation,
          ),
           Marker(
            markerId: const MarkerId("destination"),
            icon: destinationIcon,
            position: destination,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}
