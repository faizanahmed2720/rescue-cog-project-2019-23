import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/home_screen/get_started.dart';
import 'package:untitled/src/Controller/auth_controller.dart';

import '../../../src/Constants/colors.dart';
import '../../../src/Utils/CommonWidgets/customTextField.dart';

class DriverSignup extends StatefulWidget {
  const DriverSignup({super.key});

  @override
  State<DriverSignup> createState() => _DriverSignupState();
}

class _DriverSignupState extends State<DriverSignup> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  final List<String> vehicleTypes = [
    'Suzuki Bolan',
    'Changhan',
    'Kinglong Van'
  ];

  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage("assets/Images/sign_up.png"),
                    fit: BoxFit.cover)),
          ),
          DropdownButtonFormField(
            value: dropdownController.text.isNotEmpty
                ? dropdownController.text
                : null,
            items: vehicleTypes
                .map(
                  (type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ),
                )
                .toList(),
            onChanged: (value) {
              dropdownController.text = value!;
            },
            decoration: const InputDecoration(
              labelText: 'Vehicle Type',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 250,
              right: 30,
              bottom: 0,
            ),
            child: Column(
              children: [
                CustomTextField(
                  controller: fullnameController,
                  icon: Icons.person,
                  placeholder: 'FULLNAME',
                  secureText: false,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController,
                  icon: Icons.email,
                  placeholder: 'EMAIL',
                  secureText: false,
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: phoneController,
                  icon: Icons.phone,
                  placeholder: 'PHONE',
                  secureText: false,
                  type: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: cnicController,
                  icon: Icons.quick_contacts_dialer_sharp,
                  placeholder: 'CNIC',
                  secureText: false,
                  type: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: phoneController,
                  icon: Icons.car_repair,
                  placeholder: 'VEHICLE',
                  secureText: false,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.password,
                  placeholder: 'PASSWORD',
                  secureText: true,
                  type: TextInputType.text,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      //used for driver signup,
                      try {
                        UserCredential? userCredential =
                            await _authController.createAccount(
                          emailController.text,
                          passwordController.text,
                          phoneController.text,
                          fullnameController.text,
                          'driver',
                        );
                        //if user crdential is null then there must be an exception.
                        if (userCredential != null) {
                          showSnackBar(
                            "Signup Successful",
                            context,
                          );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const get_started(),
                            ),
                            (route) => false,
                          );
                        } else {
                          showSnackBar(
                            "Login failed",
                            context,
                          );
                        }
                      } catch (e) {
                        //e will tell us the value of exception
                        showSnackBar(
                          e.toString(),
                          context,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 10),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(String text, BuildContext context) {
  var snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
