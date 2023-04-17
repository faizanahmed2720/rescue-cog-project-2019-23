import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/user_model.dart';

class FirestoreController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> postUserDataToFirestore(
    UserModel userModel,
  ) async {
    await _firebaseFirestore
        .collection('user')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }
}
