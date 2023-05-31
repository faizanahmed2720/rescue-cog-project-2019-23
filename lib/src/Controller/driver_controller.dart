import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/View/Driver/Driver%20Dashboard/driver_dashboard.dart';
import 'dart:io';

import '../../View/Driver/Models/driverModel.dart';
import '../../View/Driver/driver Management/driverLogin_screen.dart';
import '../Theme/colors.dart';

class  driverController extends GetxController {
  static driverController get instance => Get.find();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get driver => _auth.currentUser;

  final firebaseInstance = FirebaseFirestore.instance;

  // Firebase Storage Variables
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> createUser(driverModel user) async {
    await firebaseInstance
        .collection("driver")
        .doc(getCurrentUserUid().toString())
        .set(user.toJason())
        .whenComplete(() => Get.snackbar(
        "Success", "Your account has been created",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: primaryColor,
        colorText: Colors.white))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try Again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: Colors.white);
    });
    await firebaseInstance
        .collection("driver")
        .doc(getCurrentUserUid().toString())
        .collection("AccountType").add({"type": "2"}).whenComplete(() => {Get.to (const driverDashboard())});
  }

  Future<driverModel> getUserDetails() async {
    final snapshot = await _firebaseFirestore
        .collection("driver")
        .where("uid", isEqualTo: getCurrentUserUid().toString())
        .get();
    final userdata =
        snapshot.docs.map((e) => driverModel.fromSnapshot(e)).single;
    return userdata;
  }

  Future<List<driverModel>> getAllUserdetail() async {
    final snapshot = await _firebaseFirestore.collection("driver").get();
    final userdata =
    snapshot.docs.map((e) => driverModel.fromSnapshot(e)).toList();
    return userdata;
  }

  Future<void> updateUserRecord(driverModel user) async {
    await _firebaseFirestore
        .collection("driver")
        .doc(getCurrentUserUid().toString())
        .update(user.toJason())
        .whenComplete(() => {
      Get.snackbar("Success", "Your profile has been updated",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: Colors.white)
    });
  }

  Future uploadImageAndGetLink(File imageFile) async {
    if (imageFile == null) {
      return null;
    }
    // Get a reference to the Firebase Storage location where the image will be uploaded
    final Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}');

    // Upload the image to Firebase Storage
    final UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));

    // Get the download URL of the image
    final String url = (await downloadUrl.ref.getDownloadURL());

    // Store the download URL of the image in Firebase Firestore
    await FirebaseFirestore.instance
        .collection("driver")
        .doc(getCurrentUserUid().toString())
        .update({"profileImage": url});
        // .add({'ProfileImage': url});

    // Return the download URL of the image
    return url;
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
