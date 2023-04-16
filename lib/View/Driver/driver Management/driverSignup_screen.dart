import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../src/Constants/colors.dart';
import '../../../src/Utils/CommonWidgets/customTextField.dart';

class driverSignup extends StatefulWidget {
  const driverSignup({super.key});

  @override
  State<driverSignup> createState() => _driverSignupState();
}

class _driverSignupState extends State<driverSignup> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController vehicleController = TextEditingController(); //
  TextEditingController passwordController = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  final List<String> vehicleTypes = [
    'Suzuki Bolan',
    'Changhan',
    'Kinglong Van'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/sign_up.png"),
                    fit: BoxFit.cover)),
          ),
          DropdownButtonFormField(
            value: dropdownController.text.isNotEmpty
                ? dropdownController.text
                : null,
            items: vehicleTypes
                .map((type) => DropdownMenuItem(child: Text(type), value: type))
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
            padding: const EdgeInsets.fromLTRB(30, 250, 30, 0),
            child: Column(
              children: [
                CustomTextField(
                  controller: fullnameController,
                  icon: Icons.person,
                  placeholder: 'FULLNAME',
                  secureText: false,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController,
                  icon: Icons.email,
                  placeholder: 'EMAIL',
                  secureText: false,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: phoneController,
                  icon: Icons.phone,
                  placeholder: 'PHONE',
                  secureText: false,
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: cnicController,
                  icon: Icons.quick_contacts_dialer_sharp,
                  placeholder: 'CNIC',
                  secureText: false,
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: phoneController,
                  icon: Icons.car_repair,
                  placeholder: 'VEHICLE',
                  secureText: false,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.password,
                  placeholder: 'PASSWORD',
                  secureText: true,
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: secondaryColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
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
