// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class fireBrigades extends StatefulWidget {
//   @override
//   _fireBrigadesState createState() => _fireBrigadesState();
// }
//
// class _fireBrigadesState extends State<fireBrigades> {
//   LatLng? userLocation;
//   TextEditingController addressController = TextEditingController();
//
//   @override
//   void dispose() {
//     addressController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Emergency Service'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               initialCameraPosition: const CameraPosition(
//                 target: LatLng(0, 0),
//                 zoom: 10.0,
//               ),
//               markers: userLocation! = null
//                   ? {...?{
//                 Marker(
//                   markerId: MarkerId('userLocation'),
//                   position: userLocation!,
//                 ),
//               }}
//                   : null,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: addressController,
//               decoration: const InputDecoration(
//                 labelText: 'Address',
//               ),
//             ),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               String address = addressController.text;
//               // Perform further actions with the user's address
//               print('User Address: $address');
//             },
//             child: Text('Confirm Location'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_navigation/get_navigation.dart';
// //
// // class fireBrigades extends StatefulWidget {
// //   const fireBrigades({super.key});
// //
// //   @override
// //   State<fireBrigades> createState() => _fireBrigadesState();
// // }
// //
// // class _fireBrigadesState extends State<fireBrigades> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_rounded, color: Colors.white) ),
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //       ),
// //       extendBodyBehindAppBar: true,
// //       body: Center(child: Text("This is Fire Brigades Screen")),
// //     );
// //   }
// // }
