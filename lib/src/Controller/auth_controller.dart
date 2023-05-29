// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/src/Controller/firebase_controller.dart';

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;
  final FirestoreController _firestoreService = FirestoreController();

  Future<UserCredential?> createAccount(
    String email,
    String password,
    // String userName,
    // String phoneNumber,
    // String userType,
  ) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // user = _firebaseAuth.currentUser;
      // if (userCredential != null) {
      //   _firestoreService.postUserDataToFirestore(
      //     UserModel(
      //       userName: userName,
      //       email: email,
      //       uid: user!.uid,
      //       phoneNumber: phoneNumber,
      //     ),
      //     userType,
      //   );
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw ('Email already in use');
      } else {
        throw ('Something went wrong${e.code} ${e.message}');
      }
    }
    return userCredential;
  }

  Future<UserCredential?> signInUser(String email, String password) async {
    UserCredential? userCredential;
    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        throw ("Email or password is incorrect");
      } else if (e.code == "user-not-found") {
        throw ('User not found');
      } else if (e.code == "network-request-failed") {
        throw ("${e.code}${e.message}");
      } else {
        throw ('Something went wrong ${e.code} ${e.message}');
      }
    }
    return userCredential;
  }

  Future<bool> checkScannerExistInManagerAccount() async {
    // Check if vehicle number already exists in Firestore database
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('driver')
        .doc(getCurrentUserUid())
        .collection("AccountType")
        .where('type', isEqualTo: "2")
        .get();
    return snapshot.docs.isNotEmpty;
  }

 static final _auth = FirebaseAuth.instance;
  String getCurrentUserUid()  {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw Exception("No signed-in user.");
    }
  }



}
