import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/Patient/splash_screen/intro_screen.dart';
import '../../../src/Controller/auth_controller.dart';
import '../../../src/Controller/authentication_repository.dart';
import '../../Driver/Driver Dashboard/driver_dashboard.dart';
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
    Future.delayed(const Duration(seconds:2), () {
      // user == null ? Get.offAll(() => IntroScreen()) : Get.offAll(() => const driverDashboard());
      // Get.put(AuthenticationRepository());
      checkCurrentUser();
    });
  }

Future<void> checkCurrentUser() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;

  if(user == null){
    Get.offAll(() => const IntroScreen());
  }else{
    if(await _controller.checkScannerExistInManagerAccount()==true)
  {
  Get.offAll(() => const driverDashboard());
  }
  else{
  Get.offAll(() => const userDashboard());
  }
}
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
