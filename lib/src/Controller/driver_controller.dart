import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../Theme/colors.dart';

class driverController extends GetxController {
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
          colorText: Colors.black)
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

class driverModel {
  final String? uid;
  final String fullname;
  final String email;
  final String phoneNo;
  final String vehicleType;
  final String password;
  final String? vehicleNumber;
  final String? residence;
  final String? gender;
  final String? dateofBirth;
  final String? cnic;
  final String? profileImage;

  driverModel(
      {this.uid,
        required this.fullname,
        required this.email,
        required this.phoneNo,
        required this.password,
        required this.vehicleType,
        this.vehicleNumber,
        this.residence,
        this.gender,
        this.dateofBirth,
        this.cnic,
        this.profileImage});

  toJason() {
    return {
      "uid": uid,
      "userName": fullname,
      "email": email,
      "phoneNumber": phoneNo,
      "vehicleType": vehicleType,
      "password": password,
      "vehicleNumber": vehicleNumber,
      "residence": residence,
      "gender": gender,
      "date of Birth": dateofBirth,
      "cnic": cnic,
      "profileImage": profileImage,
    };
  }

  factory driverModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return driverModel(
      uid: data["uid"],
      fullname: data["userName"],
      email: data["email"],
      phoneNo: data["phoneNumber"],
      vehicleType: data["vehicleType"],
      password: data["password"],
      vehicleNumber: data["vehicleNumber"],
      residence: data["residence"],
      gender: data["gender"],
      dateofBirth: data["date of Birth"],
      cnic: data["cnic"],
      profileImage: data["profileImage"],
    );
  }
}
