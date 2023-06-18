import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../src/Theme/colors.dart';
import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
import '../../../src/Utils/CommonWidgets/UserFloatingActionButton.dart';
import 'find_driver.dart';

class UserLocation extends StatefulWidget {
  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  late GoogleMapController _mapController;
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  late LatLng _sourceLocation;
  late LatLng _destinationLocation;
  Set<Marker> _markers = {}; // Added markers set
  Set<Polyline> _polylines = {}; // Added polylines set

  @override
  void dispose() {
    _mapController.dispose();
    _sourceController.dispose();
    _destinationController.dispose();
    super.dispose();
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
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButtonWithNotched(),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;
              });
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(31.6211, 74.2824),
              // Default initial location (San Francisco)
              zoom: 12.0,
            ),
            markers: _markers, // Added markers property
            polylines: _polylines, // Added polylines property
          ),
          Container(
            height: 320,
            // alignment: Alignment.center,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: primaryColor,
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(80, 60, 20, 0),
              child: Text(
                "YOUR LOCATION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: _sourceController,
                        decoration: InputDecoration(
                          hintText: 'Enter source location',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        controller: _destinationController,
                        decoration: InputDecoration(
                          hintText: 'Enter destination location',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _findDriver();
                    Get.to(const FindDriver());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                    minimumSize: Size(150, 40),
                  ),
                  child: Text('Find Driver'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 290.0,
            child: FloatingActionButton(
              onPressed: () {
                _getCurrentLocation();
              },
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _findDriver() async {
    // Get source location coordinates
    Position sourcePosition = await Geolocator.getCurrentPosition();
    setState(() {
      _sourceLocation = LatLng(sourcePosition.latitude, sourcePosition.longitude);
    });

    // Get destination location coordinates
    String destinationString = _destinationController.text;
    List<String> latLng = destinationString.split(',');
    if (latLng.length == 2) {
      double? lat;
      double? lng;
      try {
        lat = double.parse(latLng[0].trim())!;
        lng = double.parse(latLng[1].trim())!;
      } catch (e) {
        print('Invalid input format. Please provide latitude and longitude in decimal format.');
        return;
      }

      if (lat != null && lng != null && lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180) {
        setState(() {
          _destinationLocation = LatLng(lat!, lng!);
          _destinationController.text = '$lat, $lng'; // Set the destination location text field
        });

        LatLngBounds bounds = LatLngBounds(
          southwest: _sourceLocation,
          northeast: _destinationLocation,
        );
        _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100.0));

        print('Destination Latitude: ${_destinationLocation.latitude}');
        print('Destination Longitude: ${_destinationLocation.longitude}');
      } else {
        print('Invalid latitude or longitude value. Please provide valid values within the range (-90 to 90 for latitude and -180 to 180 for longitude).');
      }
    } else {
      print('Invalid input format. Please provide latitude and longitude in decimal format.');
    }
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    _sourceController.text = "${position.latitude},${position.longitude}";
    setState(() {
      LatLng userLocation = LatLng(position.latitude, position.longitude);
      _markers = {
        Marker(
          markerId: const MarkerId('user_location'),
          position: userLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        )
      };
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: userLocation,
            zoom: 15.0,
          ),
        ),
      );
    });
  }
}





// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../src/Theme/colors.dart';
// import '../../../src/Utils/CommonWidgets/UserCustomBottomNavigationBar.dart';
// import '../../../src/Utils/CommonWidgets/UserFloatingActionButton.dart';
// import 'find_driver.dart';
//
// class UserLocation extends StatefulWidget {
//   @override
//   _UserLocationState createState() => _UserLocationState();
// }
//
// class _UserLocationState extends State<UserLocation> {
//   late GoogleMapController _mapController;
//   final TextEditingController _sourceController = TextEditingController();
//   final TextEditingController _destinationController = TextEditingController();
//   late LatLng _sourceLocation;
//   late LatLng _destinationLocation;
//   Set<Marker> _markers = {}; // Added markers set
//   Set<Polyline> _polylines = {}; // Added polylines set
//
//   @override
//   void dispose() {
//     _mapController.dispose();
//     _sourceController.dispose();
//     _destinationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       bottomNavigationBar: CustomNavigationBar(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
//       floatingActionButton: FloatingActionButtonWithNotched(),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: (controller) {
//               setState(() {
//                 _mapController = controller;
//               });
//             },
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(31.6211, 74.2824),
//               // Default initial location (San Francisco)
//               zoom: 12.0,
//             ),
//             markers: _markers, // Added markers property
//             polylines: _polylines, // Added polylines property
//           ),
//           Container(
//             height: 320,
//             // alignment: Alignment.center,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(25),
//                 bottomRight: Radius.circular(25),
//               ),
//               color: primaryColor,
//             ),
//             child: const Padding(
//               padding: EdgeInsets.fromLTRB(80, 60, 20, 0),
//               child: Text(
//                 "YOUR LOCATION",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 120.0,
//             left: 20.0,
//             right: 20.0,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     SizedBox(width: 10.0),
//                     Expanded(
//                       child: TextField(
//                         controller: _sourceController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter source location',
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     SizedBox(width: 10.0),
//                     Expanded(
//                       child: TextField(
//                         controller: _destinationController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter destination location',
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     _findDriver();
//                     // Get.to(const FindDriver());
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: secondaryColor,
//                     minimumSize: Size(150, 40),
//                   ),
//                   child: Text('Find Driver'),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 30.0,
//             right: 290.0,
//             child: FloatingActionButton(
//               onPressed: () {
//                 _getCurrentLocation();
//               },
//               child: Icon(Icons.my_location),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _findDriver() async {
//     // Get source location coordinates
//     Position sourcePosition = await Geolocator.getCurrentPosition();
//     setState(() {
//       _sourceLocation = LatLng(sourcePosition.latitude, sourcePosition.longitude);
//     });
//
//     // Get destination location coordinates
//     String destinationString = _destinationController.text;
//     List<String> latLng = destinationString.split(',');
//     if (latLng.length == 2) {
//       double? lat;
//       double? lng;
//       try {
//         lat = double.parse(latLng[0]);
//         lng = double.parse(latLng[1]);
//       } catch (e) {
//         print('Invalid input format. Please provide latitude and longitude in decimal format.');
//         return;
//       }
//
//       if (lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180) {
//         setState(() {
//           _destinationLocation = LatLng(lat!, lng!);
//         });
//
//         LatLngBounds bounds = LatLngBounds(
//           southwest: _sourceLocation,
//           northeast: _destinationLocation,
//         );
//         _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100.0));
//
//         print('Destination Latitude: ${_destinationLocation.latitude}');
//         print('Destination Longitude: ${_destinationLocation.longitude}');
//       } else {
//         print('Invalid latitude or longitude value. Please provide valid values within the range (-90 to 90 for latitude and -180 to 180 for longitude).');
//       }
//     } else {
//       print('Invalid input format. Please provide latitude and longitude in decimal format.');
//     }
//   }
//
//   Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition();
//     _sourceController.text = "${position.latitude},${position.longitude}";
//     setState(() {
//       LatLng userLocation = LatLng(position.latitude, position.longitude);
//       _markers = {
//         Marker(
//           markerId: const MarkerId('user_location'),
//           position: userLocation,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//         )
//       };
//       _mapController.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             target: userLocation,
//             zoom: 15.0,
//           ),
//         ),
//       );
//     });
//   }
// }
