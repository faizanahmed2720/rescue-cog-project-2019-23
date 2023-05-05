import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String userName;
  String email;
  String phoneNumber;
   String? uid;

  UserModel({
    required this.email,
    required this.userName,
    required this.phoneNumber,
    this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
//command to build models
// flutter pub run build_runner build --delete-conflicting-outputs