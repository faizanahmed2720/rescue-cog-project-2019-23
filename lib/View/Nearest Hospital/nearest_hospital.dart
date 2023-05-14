import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearestHospital extends StatefulWidget {
  @override
  _NearestHospitalState createState() => _NearestHospitalState();
}

class _NearestHospitalState extends State<NearestHospital> {
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
    _addMarker(LatLng(31.4905, 74.3048), 'Shaukat Khanum');
    _addMarker(LatLng(31.4846, 74.2974), 'Jinnah Hospital');
    _addMarker(LatLng(31.5131, 74.3609), 'Doctors Hospital');
    _addMarker(LatLng(31.5334, 74.3502), 'National Hospital');
    _addMarker(LatLng(31.5612, 74.3225), 'Punjab Institute of Cardiology');
    _addMarker(LatLng(31.5112, 74.3447), 'Ittefaq Hospital');
    _addMarker(LatLng(31.6123, 74.2968), 'Shalamar Hospital');
    _addMarker(LatLng(31.5708, 74.3063), 'Mayo Hospital');
    _addMarker(LatLng(31.5452, 74.2964), 'Hameed Latif Hospital');
    _addMarker(LatLng(31.4977, 74.3182), 'Farooq Hospital');
    _addMarker(LatLng(31.5177, 74.3218), 'Fatima Memorial Hospital');
    _addMarker(LatLng(31.4964, 74.2956), 'Surgimed Hospital');
    _addMarker(LatLng(31.5313, 74.3969), 'Sharif Medical City Hospital');
    _addMarker(LatLng(31.5547, 74.3162), 'Sheikh Zayed Hospital');
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





// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class NearestHospital extends StatefulWidget {
//   const NearestHospital({super.key});

//   @override
//   State<NearestHospital> createState() => _NearestHospitalState();
// }

// class _NearestHospitalState extends State<NearestHospital> {
//   var mapmarker = HashSet<Marker>();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Find Nearest Hospital"),
//           ),
//           body: GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(37.43296265331129, -122.08832357078792),
//             ),
//             onMapCreated: (controller) {
//               setState(() {
//                 mapmarker.add(Marker(
//                   markerId: MarkerId(
//                       "Shaukat Khanum Memorial Cancer Hospital and Research Centre"),
//                   position: LatLng(31.4635, 74.2659),
//                 ));
//               });
//             },
//             markers: mapmarker,
//           )),
//     );
//   }
// }
