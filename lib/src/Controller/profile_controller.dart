import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../Theme/colors.dart';
import 'driver_controller.dart';

class profileController extends GetxController {
  static profileController get instance => Get.find();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  // Firebase Storage Variables
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> createUser(profileModel user)  async {
    await _firebaseFirestore
        .collection("user")
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

  Future<profileModel> getUserDetails() async {
    final snapshot = await _firebaseFirestore
        .collection("user")
        .where("uid", isEqualTo: getCurrentUserUid().toString())
        .get();
    final userdata =
        snapshot.docs.map((e) => profileModel.fromSnapshot(e)).single;
    return userdata;
  }



  Future<List<driverModel>> getAllUserdetail() async {
    final snapshot = await _firebaseFirestore.collection("driver").get();
    final userdata =
        snapshot.docs.map((e) => driverModel.fromSnapshot(e)).toList();
    return userdata;
  }

  Future<void> updateUserRecord(profileModel user) async {
    await _firebaseFirestore
        .collection("user")
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
        .collection("user")
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

class profileModel {
  final String? uid;
  final String fullname;
  final String email;
  final String phoneNo;
  final String password;
  final String? residence;
  final String? gender;
  final String? dateofBirth;
  final String? cnic;
  final String? profileImage;

  profileModel(
      {
        this.uid,
      required this.fullname,
      required this.email,
      required this.phoneNo,
      required this.password,
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
      "password": password,
      "residence": residence,
      "gender": gender,
      "date of Birth": dateofBirth,
      "cnic": cnic,
      "profileImage": profileImage,
    };
  }

  factory profileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return profileModel(
      uid: data["uid"],
      fullname: data["userName"],
      email: data["email"],
      phoneNo: data["phoneNumber"],
      password: data["password"],
      residence: data["residence"],
      gender: data["gender"],
      dateofBirth: data["date of Birth"],
      cnic: data["cnic"],
      profileImage: data["profileImage"],
    );
  }
}
