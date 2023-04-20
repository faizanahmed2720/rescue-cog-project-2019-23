import 'package:flutter/material.dart';
import 'package:untitled/src/Utils/CommonWidgets/customBottomNavigationBar.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is User Profile Screen")),
    );
  }
}
