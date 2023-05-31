import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../View/Driver/Driver Dashboard/driver_dashboard.dart';
import '../../View/Patient/User Dashboard/userDashoard_screen.dart';
import '../../View/Patient/splash_screen/intro_screen.dart';
import 'auth_controller.dart';



class AuthenticationRepository extends GetxController{
  static  AuthenticationRepository get instance => Get.find();
  final AuthController _controller = AuthController();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  User? user = FirebaseAuth.instance.currentUser;


  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(user) async {
    // user == null ? Get.offAll(() => IntroScreen()) : Get.offAll(() => const driverDashboard());
    print(user);
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

}