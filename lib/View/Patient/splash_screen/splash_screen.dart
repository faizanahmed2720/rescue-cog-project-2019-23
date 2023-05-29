import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/Driver/Driver%20Dashboard/driver_dashboard.dart';
import 'package:untitled/View/Patient/splash_screen/intro_screen.dart';

import '../../../src/Controller/auth_controller.dart';
import '../User Dashboard/userDashoard_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final AuthController _controller = AuthController();
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  Future<bool> getBool () async {
    return await _controller.checkScannerExistInManagerAccount();
  }

  _navigatetohome() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const IntroScreen()


      // user == null ? const IntroScreen() : const userDashboard(),


        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*navigateAfterSeconds: HomeScreen(),*/

      body: Container(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Image.asset(
            'assets/Images/logo.png',
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
