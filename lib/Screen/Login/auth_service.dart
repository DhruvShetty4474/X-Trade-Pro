// import 'dart:developer';
//
// import 'package:login_test1/BU_LOGIC/Auth_version.dart';
//
// class AuthService {
//    Future  <LoginResult> login(String username, String password, String? userType) async {
//
//     // Simulating network request
//     await Future.delayed( const Duration(seconds: 1));
//
//     if (username == "USER1" && password == "Password@1" && userType != null) {
//       if (userType == "ADMIN") {
//         log('Login Successful as ADMIN!');
//         return LoginResult(success: true, userType: userType);//will return the usertype and success value.
//
//       } else if (userType == "DEALER") {
//         log('Login Successful as DEALER!');
//         return LoginResult(success: true, userType: userType);//will return the usertype and success value.
//       }
//       // if (versionno == 1005){
//       //   return LoginResult(success: true, userType: userType);
//       // }
//       // else{
//       //   log('There is a version mismatch');
//       // }
//
//
//
//
//     }
//     //if the user_credentials fails....
//     log('Invalid credentials or user type.');
//     return LoginResult(success: false);
//   }
// }
//
// class LoginResult {
//   final bool success;
//   final String? userType;
//
//   LoginResult({required this.success, this.userType});
// }