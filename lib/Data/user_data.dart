import 'dart:developer';

import '../MODELS/LoginR.dart';
import '../Test/TCP/test_Str.dart';


class UserDataStorage {
  static List<Loginuserdata> loginResponseList = [];
}

// static void addLoginResponse(LoginResponse_Model response) {
//   loginResponseList.add(response);
//   if (loginResponseList.length > 10) {  // Keep only the last 10 responses
//     loginResponseList.removeAt(0);
//   }
// }
// static LoginResponse_Model? getLatestLoginResponse() {
//   return loginResponseList.isNotEmpty ? loginResponseList.last : null;
// }
//
// static void clearLoginResponses() {
//   loginResponseList.clear();
// }
// static void printLoginResponses() {
//   // log('--- Stored Login Responses ---');
//   for (int i = 0; i < loginResponseList.length; i++) {
//     final response = loginResponseList[i];
//     log('Login Response ${i + 1}:');
//     log('  Client ID: ${response.clientID}');
//     log('  Login Type: ${response.loginType}');
//     log('  Version: ${response.messageHeader?.versionNo}');
//     log('  Username: ${response.userName}');
//     log('  Message Code: ${response.messageHeader?.msgCode}');
//     log('  Error Code: ${response.messageHeader?.errorCode}');
//     log('-----------------------------');
//   }
//   log('Total stored responses: ${loginResponseList.length}');
// }


// class UserDataStorage {
//   // A global list to store login responses
//   static List<LoginResponse> loginResponseList = [ ];
//
// static void printLoginResponses() {
//   // log('--- Stored Login Responses ---');
//   for (int i = 0; i < loginResponseList.length; i++) {
//     final response = loginResponseList[i].loginResponse;
//     log('Login Response ${i + 1}:');
//     log('  Client ID: ${response.clientID}');
//     log('  Login Type: ${response.loginType}');
//     log('  Version: ${response.messageHeader?.versionNo}');
//     log('  Username: ${response.userName}');
//     log('  Message Code: ${response.messageHeader?.msgCode}');
//     log('  Error Code: ${response.messageHeader?.errorCode}');
//     log('-----------------------------');
//   }
//   log('Total stored responses: ${loginResponseList.length}');
// }
//
//



//


// a "list of login data objects" or "login data collection".