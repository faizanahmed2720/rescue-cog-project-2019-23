// class DriverModel {
//   final String fullname;
//   final String email;
//   final String phone;
//   final String cnic;
//   final String vehicletype;
//   final String password;
  
//   DriverModel(
//       required this.fullname,
//       required this.email,
//       required this.phone,
//       required this.cnic,
//       required this.vehicletype,
//       required this.password,

//   toJason() {
//     return {
//       "Full Name": fullname,
//       "Email": email,
//       "Phone": phone,
//       "CNIC": cnic,
//       "Vehicle Type": vehicletype,
//       "Password": password,
//     };
//   }

//   factory DriverModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return DriverModel(
//         fullname: data["Full Name"],
//         email: data["Email"],
//         phone: data["Phone"],
//         cnic: data["CNIC"],
//         vehicletype: data["Vehicle Type"],
//         password: data["Password"],
//   }
// }