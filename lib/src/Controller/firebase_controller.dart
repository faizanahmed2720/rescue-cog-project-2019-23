import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/models/user_model.dart';

class FirestoreController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> postUserDataToFirestore(
    UserModel userModel,
    String userType,
  ) async {
    await _firebaseFirestore
        .collection(userType == 'driver' ? 'driver' : 'user')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  getUserData(String userType) async {
    User? user = FirebaseAuth.instance.currentUser;
    final data =
        await _firebaseFirestore.collection(userType).doc(user!.uid).get();
    if (data.data() == null) return null;
    return UserModel.fromJson(data.data()!);
  }
}
