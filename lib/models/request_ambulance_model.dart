import 'package:cloud_firestore/cloud_firestore.dart';

class RequestAmbulanceModel {

  final String? requestId;
  final String? source;
  final String? destination;
  final String? profileImage;
  final String? fullName;
  final String? phoneNo;

  RequestAmbulanceModel(
      {
        this.source, this.destination, this.profileImage, this.fullName, this.phoneNo,this.requestId,
      });

  toJason() {
    return {
      "requestId": requestId,
      "source": source,
      "destination": destination,
      "profileImage": profileImage,
      "fullName": fullName,
      "phoneNo": phoneNo,
    };
  }

  factory RequestAmbulanceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return RequestAmbulanceModel(
      requestId: data["requestId"],
      source: data["source"],
      destination: data["destination"],
      profileImage: data["profileImage"],
      fullName: data["fullName"],
      phoneNo: data["phoneNo"],
    );
  }
}