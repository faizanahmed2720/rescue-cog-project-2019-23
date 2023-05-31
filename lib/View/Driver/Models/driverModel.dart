import 'package:cloud_firestore/cloud_firestore.dart';

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
