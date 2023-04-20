// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// import '../../src/Controller/auth_controller.dart';
// import '../../src/Utils/CommonWidgets/customTextField.dart';

// class DAccountSetting extends StatelessWidget {
//   const DAccountSetting({super.key});

//   class _DriverSignupState extends State<DriverSignup> {
//   TextEditingController fullnameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController cnicController = TextEditingController();
//   TextEditingController vehicleController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController dropdownController = TextEditingController();
//   final List<String> vehicleTypes = [
//     'Suzuki Bolan',
//     'Changhan',
//     'Kinglong Van'
//   ];

//   final AuthController _authController = AuthController();
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(
//                           "assets/Images/Driver Account Setting/driver_account_setting.png"),
//                       fit: BoxFit.cover)),
//             ),
//           ),
//           const SizedBox(
//             height: 200,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 30,
//               top: 250,
//               right: 30,
//               bottom: 0,
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   CustomTextField(
//                     controller: fullnameController,
//                     icon: Icons.person,
//                     placeholder: 'FULLNAME',
//                     secureText: false,
//                     type: TextInputType.text,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     controller: phoneController,
//                     icon: Icons.phone,
//                     placeholder: 'PHONE',
//                     secureText: false,
//                     type: TextInputType.number,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     controller: residenceController,
//                     icon: Icons.location_city,
//                     placeholder: 'RESIDENCE',
//                     secureText: false,
//                     type: TextInputType.text,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     controller: genderController,
//                     icon: Icons.sex,
//                     placeholder: 'GENDER',
//                     secureText: false,
//                     type: TextInputType.number,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     controller: cnicController,
//                     icon: Icons.quick_contacts_dialer_sharp,
//                     placeholder: 'CNIC',
//                     secureText: false,
//                     type: TextInputType.number,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     controller: cnicController,
//                     icon: Icons.quick_contacts_dialer_sharp,
//                     placeholder: 'CNIC',
//                     secureText: false,
//                     type: TextInputType.number,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   DropdownButtonFormField(
//                     value: dropdownController.text.isNotEmpty
//                         ? dropdownController.text
//                         : null,
//                     items: vehicleTypes
//                         .map(
//                           (type) => DropdownMenuItem(
//                             value: type,
//                             child: Text(type),
//                           ),
//                         )
//                         .toList(),
//                     onChanged: (value) {
//                       dropdownController.text = value!;
//                     },
//                     decoration: const InputDecoration(
//                       labelText: 'Vehicle Type',
//                       icon: Icon(Icons.car_rental),
//                       focusedBorder: InputBorder.none,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   CustomTextField(
//                     controller: passwordController,
//                     icon: Icons.password,
//                     placeholder: 'PASSWORD',
//                     secureText: true,
//                     type: TextInputType.text,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   ElevatedButton(
//                       onPressed: () async {
//                         //used for driver signup,
//                         try {
//                           UserCredential? userCredential =
//                               await _authController.createAccount(
//                             emailController.text,
//                             passwordController.text,
//                             phoneController.text,
//                             fullnameController.text,
//                             'driver',
//                           );
//                           //if user crdential is null then there must be an exception.
//                           if (userCredential != null) {
//                             showSnackBar(
//                               "Signup Successful",
//                               context,
//                             );
//                             Navigator.of(context).pushAndRemoveUntil(
//                               MaterialPageRoute(
//                                 builder: (context) => const get_started(),
//                               ),
//                               (route) => false,
//                             );
//                           } else {
//                             showSnackBar(
//                               "Login failed",
//                               context,
//                             );
//                           }
//                         } catch (e) {
//                           //e will tell us the value of exception
//                           showSnackBar(
//                             e.toString(),
//                             context,
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(primary: secondaryColor),
//                       child: const Padding(
//                         padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                         child: Text(
//                           "SIGNUP",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       )),
//                   SizedBox(
//                     height: 58,
//                   ),
//                   SizedBox(
//                     height: 28,
//                     width: 200,
//                     child: TextButton(
//                         onPressed: () {
//                           Get.to(DriverLogin());
//                         },
//                         style: TextButton.styleFrom(
//                             backgroundColor: Colors.transparent, elevation: 0),
//                         child: const Padding(
//                           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                           child: Text(
//                             "",
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
