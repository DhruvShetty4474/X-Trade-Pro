// // MOKE DATA
// //Demo Login Response.....
//
//
// // So the logic is im defining the data/var/structure
// // on test_Str and saving that data in another
// // class(currently it is working as a mock data)
// // and by class this class login authentication is been done.
//
import 'dart:convert';
import 'dart:typed_data';

import '../Test/TCP/SBT.dart';
import '../Test/TCP/strct_size_cal.dart';
import '../Test/TCP/test_Str.dart';

class LoginResponse_Model{
  late LoginResponse loginResponse;

  LoginResponse_Model(String userName, String password, int loginType){
    loginResponse = LoginResponse(
        msgSize: 100,// calculated message size of the response
        messageHeader: ResponseMessageHeader(
          packetSize: 200,//the size of the poacket by calculating
          msgCode: 12,  // Assuming 12 is success // This is when the username in the server matches the usernane which is send in the reqauest recived from the client and that is USER@1 this should match with data received to the server from the client.
          errorCode: 0,//This shoould be constant and same condition with the msgcode
          versionNo: 1005,//This shoould be constant and same condition with the msgcode
        ),
        userName: utf8.encode(userName),//will be recived from client side reqyuest
        password: utf8.encode(password),//will be recived from client side reqyuest
        loginType: loginType,//will be recived from client side reqyuest
        nTokenCount: 5, //This shoould be constant and same condition with the msgcode
        strategyType: 1,//This shoould be constant and same condition with the msgcode
        clientID: 123456//This shoould be constant and same condition with the msgcode
    );

  }
}

// class LoginRequest_Model{
//
//   late LoginRequest loginRequest;
//   LoginRequest_Model(String userName, String password, int loginType){
//     // Calculate the sizes
//     int userNameLength = 50; // Fixed size for userName
//     int passwordLength = 10; // Fixed size for password
//
//     // Calculate msgSize using the previously defined function
//     int _msgSize = calculateLoginRequestSize(
//       userNameLength: userNameLength,
//       passwordLength: passwordLength,
//     );
//     loginRequest = LoginRequest(
//         msgSize: _msgSize,
//         messageHeader: RequestMessageHeader.defaultHeader(),
//         userName: utf8.encode(userName),
//         password: utf8.encode(password),
//         loginType: loginType,
//     );
//
//     Uint8List byteArray = loginRequestToBytes(loginRequest);
//   }
// }

//
//
//
// // Access or update versionNo if needed
// // int? getVersionNo() {
// //   return loginResponse.messageHeader?.versionNo;  // Access versionNo
// // }
// //
// // void setVersionNo(int newVersionNo) {
// //   loginResponse.messageHeader?.versionNo = newVersionNo;  // Update versionNo
// // }