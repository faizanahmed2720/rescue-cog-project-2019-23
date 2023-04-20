// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class userDashboard extends StatelessWidget {
  const userDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Images/sign_up.png"),
                    fit: BoxFit.cover)),
          ))
        ],
      ),
    );
  }
}
