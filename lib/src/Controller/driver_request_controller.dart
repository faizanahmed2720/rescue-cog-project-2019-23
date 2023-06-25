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

class  DriverRequestController extends GetxController {
  static DriverRequestController get instance => Get.find();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get driver => _auth.currentUser;

  final firebaseInstance = FirebaseFirestore.instance;


  Future<List<RequestAmbulanceModel>> getAllUserdetail() async {
    final snapshot = await _firebaseFirestore.collection("driver").doc(getCurrentUserUid()).collection("AmbulanceRequest").get();
    final userdata =
    snapshot.docs.map((e) => RequestAmbulanceModel.fromSnapshot(e)).toList();
    return userdata;
  }

  Future<void> declineRequest(String Id) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("driver")
          .doc(getCurrentUserUid())
          .collection("AmbulanceRequest")
          .where("requestId", isEqualTo: Id)
          .get();

      final List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (QueryDocumentSnapshot document in documents) {
        await document.reference.delete();
      }
    } catch (error) {
      // Handle error
    }
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
