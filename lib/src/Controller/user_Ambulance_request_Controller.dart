import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/Driver%20Dashboard/driver_dashboard.dart';
import 'package:untitled/src/Controller/profile_controller.dart';
import 'dart:io';

import '../../View/Driver/Models/driverModel.dart';
import '../../View/Driver/driver Management/driverLogin_screen.dart';
import '../../models/request_ambulance_model.dart';
import '../Theme/colors.dart';

class  UserRequestAmbulanceController extends GetxController {
  static UserRequestAmbulanceController get instance => Get.find();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get driver => _auth.currentUser;

  final firebaseInstance = FirebaseFirestore.instance;

  // Firebase Storage Variables
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;



  Future<profileModel> getUserDetails() async {
    final snapshot = await _firebaseFirestore
        .collection("user")
        .where("uid", isEqualTo: getCurrentUserUid().toString())
        .get();
    final userdata =
        snapshot.docs.map((e) => profileModel.fromSnapshot(e)).single;
    return userdata;
  }

  Future<void> createRequest(RequestAmbulanceModel request, String uid)  async {
    await _firebaseFirestore
        .collection("driver")
        .doc(uid).collection("AmbulanceRequest")
        .add(request.toJason())
        .whenComplete(() => Get.snackbar(
        "Success", "Your Request has been sent to driver",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primaryColor,
        colorText: Colors.black))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try Again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: Colors.black);
    });
    // phoneAuthentication(user.phone);
    // Get.to(OTPScreen());
  }

  Future<List<driverModel>> getAllUserdetail() async {
    final snapshot = await _firebaseFirestore.collection("driver").get();
    final userdata =
    snapshot.docs.map((e) => driverModel.fromSnapshot(e)).toList();
    return userdata;
  }


  String getCurrentUserUid() {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception("No signed-in user.");
    }
  }
}
