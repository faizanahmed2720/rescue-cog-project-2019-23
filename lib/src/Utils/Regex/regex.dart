// class Regex  {
//
//
//   static bool isNull(String nullCheck){
//     return nullCheck.isEmpty;
//   }
//   static bool isEmailValid(String email) {
//     return RegExp(
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(email);
//   }
//   static  bool isNameValid(String fullName){
//     return RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(fullName);
//   }
//
//   static bool isPasswordValid(String password){
//     return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>').hasMatch(password);
//   }
//
//   static bool isPhoneValid(String phoneNumber){
//     return RegExp(r"^\+?0[0-9]{10}$").hasMatch(phoneNumber);
//   }
//
// }

extension Regex on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\d{11}$");
    return phoneRegExp.hasMatch(this);
  }
}
