import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/View/User%20Dashboard/home.dart';
import 'package:untitled/View/splash_screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    User? user = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              user == null ? const IntroScreen() : const home(),
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
