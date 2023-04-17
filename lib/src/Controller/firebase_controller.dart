import 'package:cloud_firestore/cloud_firestore.dart';
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
}
