import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  final String fullname;
  final String email;
  final String phone;
  final String cnic;
  final String vehicletype;
  final String password;
  final String uid;
  final String profileImage;
  final String vehicleNumber;
  
  DriverModel(

      {
      required this.fullname,
      required this.email,
      required this.phone,
      required this.cnic,
      required this.vehicletype,
      required this.password,
        required this.uid,
        required this.profileImage,
        required this.vehicleNumber,


      });

  toJason() {
    return {
      "fullName": fullname,
      "email": email,
      "phoneNo": phone,
      "cnic": cnic,
      "vehicleType": vehicletype,
      "password": password,
      "uid": uid,
      "profileImage": profileImage,
      "vehicleNumber": vehicleNumber
    };
  }

  factory DriverModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return DriverModel(
        fullname: data["fullName"],
        email: data["email"],
        phone: data["phoneNo"],
        cnic: data["cnic"],
        vehicletype: data["vehicleType"],
        password: data["password"],
        uid: data["uid"],
        profileImage: data["profileImage"],
        vehicleNumber: data["vehicleNumber"]
    );
}
}