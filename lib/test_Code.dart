// import 'package:flutter/material.dart';
//
// class AmbulanceListItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         ListTile(
//           leading: Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.blue,
//             ),
//             child: Icon(
//               Icons.directions_car,
//               color: Colors.white,
//             ),
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'John Doe',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Vehicle Number: ABC123',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//               Text(
//                 'Vehicle Type: Ambulance',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//           trailing: Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.green,
//             ),
//             child: Icon(
//               Icons.star,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Divider(),
//         SizedBox(
//           width: double.infinity,
//           child: RaisedButton(
//             onPressed: () {
//               // Handle button press
//             },
//             color: Colors.red,
//             child: Text(
//               'Request Ambulance',
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }