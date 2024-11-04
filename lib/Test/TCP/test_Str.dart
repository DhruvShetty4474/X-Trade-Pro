// import 'dart:ffi';
// import 'dart:typed_data';
//
// import 'package:ffi/ffi.dart';
//
// base class RequestMessageHeader extends Struct {
//   @Int32()
//   external int msgCode;
//
//   @Int32()
//   external int errorCode;
//
//   @Int32()
//   external int versionNo;
//   void initialize (){
//     msgCode = 11;
//     errorCode = 0;
//     versionNo = 1005;
//   }
// }
//
// base class ResponseMessageHeader extends Struct {
//   @Int32()
//   external int packetSize;
//
//   @Int32()
//   external int msgCode;
//
//   @Int32()
//   external int errorCode;
//
//   @Int32()
//   external int versionNo;
// }
// base class LoginRequest extends Struct {
//   @Uint32()
//   external int msgSize;
//
//   external Pointer<RequestMessageHeader> header;
//
//   @Array(50)
//   external Array<Uint8> userName;
//
//   @Array(10)
//   external Array<Uint8> password;
//
//   @Uint8()
//   external int loginType;
//
//   void initialize({
//     required int msgSize,
//     required Pointer<RequestMessageHeader> header,
//     required List<int> userName,
//     required List<int> password,
//     required int loginType,
//   }) {
//     this.msgSize = msgSize;
//     this.header = header;
//
//     final nullChar = 0; // Use 0 as the null character
//
//     // Copy userName with null character padding
//     for (int i = 0; i < 50; i++) {
//       this.userName[i] = (i < userName.length) ? userName[i] : nullChar;
//     }
//
//     // Copy password with null character padding
//     for (int i = 0; i < 10; i++) {
//       this.password[i] = (i < password.length) ? password[i] : nullChar;
//     }
//
//     this.loginType = loginType;
//   }
//
//   Uint8List toByteArray() {
//     int structSize = sizeOf<LoginRequest>();
//     Uint8List byteArray = Uint8List(4 + structSize); // 4 bytes for message type and length
//
//     // Construct the header
//     byteArray[0] = 1;  // Message type for login (assumed to be 1)
//     byteArray[1] = (structSize >> 16) & 0xFF;  // High byte of size
//     byteArray[2] = (structSize >> 8) & 0xFF;   // Middle byte of size
//     byteArray[3] = structSize & 0xFF;          // Low byte of size
//
//     // Copy the struct data into the byte array (after the header)
//     Uint8List structBytes = this.ref.asTypedList(structSize);
//     byteArray.setRange(4, 4 + structSize, structBytes);
//
//     return byteArray;
//   }
// }
//
// base class ResetPasswordStructure extends Struct {
//   @Int32()
//   external int msgSize;
//
//   external Pointer<RequestMessageHeader> messageHeader;
//
//   @Array(50)
//   external Array<Uint8> userName;
//
//   @Array(10)
//   external Array<Uint8> password;
//
//   @Array(10)
//   external Array<Uint8> newPassword;
//
//   @Int32()
//   external int loginType;
//
//   void initialize({
//     required int msgSize,
//     required Pointer<RequestMessageHeader> header,
//     required List<int> userName,
//     required List<int> password,
//     required List<int> newPassword,
//     required int loginType,
//   }) {
//     this.msgSize = msgSize;
//     this.messageHeader = header;
//
//     final nullChar = 0; // Use 0 as the null character
//
//     // Copy userName with null character padding
//     for (int i = 0; i < 50; i++) {
//       this.userName[i] = (i < userName.length) ? userName[i] : nullChar;
//     }
//
//     // Copy password with null character padding
//     for (int i = 0; i < 10; i++) {
//       this.password[i] = (i < password.length) ? password[i] : nullChar;
//     }
//
//     // Copy newPassword with null character padding
//     for (int i = 0; i < 10; i++) {
//       this.newPassword[i] = (i < newPassword.length) ? newPassword[i] : nullChar;
//     }
//
//     this.loginType = loginType;
//   }
// }
//
// base class LoginResponse extends Struct {
//   @Int32()
//   external int msgSize;
//
//   external Pointer<RequestMessageHeader> messageHeader;
//
//   @Array(50)
//   external Array<Uint8> userName;
//
//   @Array(10)
//   external Array<Uint8> password;
//
//   @Int32()
//   external int loginType;
//
//   @Int32()
//   external int nTokenCount;
//
//   @Int32()
//   external int strategyType;
//
//   @Int32()
//   external int clientID;
//
//   void initialize({
//     required int msgSize,
//     required Pointer<RequestMessageHeader> header,
//     required List<int> userName,
//     required List<int> password,
//     required int loginType,
//     required int nTokenCount,
//     required int strategyType,
//     required int clientID,
//   }) {
//     this.msgSize = msgSize;
//     this.messageHeader = header;
//
//     final nullChar = 0; // Use 0 as the null character
//
//     // Copy userName with null character padding
//     for (int i = 0; i < 50; i++) {
//       this.userName[i] = (i < userName.length) ? userName[i] : nullChar;
//     }
//
//     // Copy password with null character padding
//     for (int i = 0; i < 10; i++) {
//       this.password[i] = (i < password.length) ? password[i] : nullChar;
//     }
//
//     this.loginType = loginType;
//     this.nTokenCount = nTokenCount;
//     this.strategyType = strategyType;
//     this.clientID = clientID;
//   }
// }
//
// base class TokenListDetail extends Struct {
//   @Int32()
//   external int token;
//
//   @Int32()
//   external int stream;
// }
//
// base class TokenListResponse extends Struct {
//   external ResponseMessageHeader responseHeader;
//
//   @Array(150)
//   external Array<TokenListDetail> tokenDetails;
// }
//
// base class LoginResponseEnd extends Struct {
//   @Int32()
//   external int packetSize;
//
//   @Int32()
//   external int msgCode;
//
//   @Int32()
//   external int errorCode;
//
//   @Int32()
//   external int versionNo;
// }
//
// Define the RequestMessageHeader class
import 'dart:convert';

class RequestMessageHeader {
  late final int msgCode;
  late final int errorCode;
  late final int versionNo;

  RequestMessageHeader({
    required int msgCode,
    required int errorCode,
    required int versionNo,
  }){
    this.msgCode = _asInt32(msgCode);
    this.errorCode = _asInt32(errorCode);
    this.versionNo = _asInt32(versionNo);
  }

  // Factory to create a header with default values
  factory RequestMessageHeader.defaultHeader() {
    return RequestMessageHeader(
      msgCode: 11,
      errorCode: 0,
      versionNo: 1005,
    );
  }
  // Static method to convert to 32-bit int
  static int _asInt32(int value) {
    return (value & 0xFFFFFFFF).toSigned(32);
  }
}

// Define the ResponseMessageHeader class
class ResponseMessageHeader {
  late final int packetSize;
  late final int msgCode;
  late final int errorCode;
  late final int versionNo;

  ResponseMessageHeader({
    required packetSize,
    required msgCode,
    required errorCode,
    required versionNo,
  }){
    this.packetSize = _asInt32(packetSize);
    this.msgCode = _asInt32(msgCode);
    this.errorCode = _asInt32(errorCode);
    this.versionNo = _asInt32(versionNo);
  }
  @override
  String toString() {
    return 'ResponseMessageHeader(msgCode: $msgCode, packetSize: $packetSize, errorCode: $errorCode, versionNo: $versionNo )';
  }
  // Static method to convert to 32-bit int
  static int _asInt32(int value) {
    return (value & 0xFFFFFFFF).toSigned(32);
  }
}

// A utility method to pad a list to a specified size
 List<int> _padList(List<int> input, int targetSize, [int paddingValue = 0]) {
  final paddedList = List<int>.filled(targetSize, paddingValue);
  for (int i = 0; i < input.length && i < targetSize; i++) {
    paddedList[i] = input[i];
  }
  return paddedList;
}

// Define the LoginRequest class
class LoginRequest {
  late final int msgSize;
  late final RequestMessageHeader messageHeader;
  late final List<int> userName;  // Size of 50
  late final List<int> password;  // Size of 10
  late final int loginType;

  LoginRequest({
    required int msgSize,
    required RequestMessageHeader messageHeader,
    required List<int> userName,
    required List<int> password,
    required int loginType,
  }) {
    this.msgSize = _asInt32(msgSize);
    this.messageHeader = messageHeader;
    this.userName = _padList(userName, 50);
    this.password = _padList(password, 10);
    this.loginType = _asInt32(loginType);
  }
  factory LoginRequest.initialize({
    required int msgSize,
    required RequestMessageHeader header,
    required List<int> userName,
    required List<int> password,
    required int loginType,
  }) {
    return LoginRequest(
      msgSize: msgSize,
      messageHeader: header,
      userName: userName,
      password: password,
      loginType: loginType,
    );
  }
  // Static method to convert to 32-bit int
  static int _asInt32(int value) {
    return (value & 0xFFFFFFFF).toSigned(32);
  }
}

// Define the ResetPasswordStructure class
class ResetPasswordStructure {
  final int msgSize;
  final RequestMessageHeader messageHeader;
  final List<int> userName;    // Size of 50
  final List<int> password;    // Size of 10
  final List<int> newPassword; // Size of 10
  final int loginType;

  ResetPasswordStructure({
    required this.msgSize,
    required this.messageHeader,
    required this.userName,
    required this.password,
    required this.newPassword,
    required this.loginType,
  });

  factory ResetPasswordStructure.initialize({
    required int msgSize,
    required RequestMessageHeader header,
    required List<int> userName,
    required List<int> password,
    required List<int> newPassword,
    required int loginType,
  }) {
    return ResetPasswordStructure(
      msgSize: msgSize,
      messageHeader: header,
      userName: _padList(userName, 50),
      password: _padList(password, 10),
      newPassword: _padList(newPassword, 10),
      loginType: loginType,
    );
  }
}

class LoginResponse {
  late final int msgSize;
  late final ResponseMessageHeader messageHeader;
  late final List<int> userName;  // Size of 50
  late final List<int> password;  // Size of 10
  late final int loginType;
  late final int nTokenCount;
  late final int strategyType;
  late final int clientID;

  LoginResponse({
    required int msgSize,
    required ResponseMessageHeader messageHeader,
    required List<int> userName,
    required List<int> password,
    required int loginType,
    required int nTokenCount,
    required int strategyType,
    required int clientID,
  }) {
    this.msgSize = _asInt32(msgSize);
    this.messageHeader = messageHeader;
    this.userName = _padList(userName, 50);
    this.password = _padList(password, 10);
    this.loginType = _asInt32(loginType);
    this.nTokenCount = _asInt32(nTokenCount);
    this.strategyType = _asInt32(strategyType);
    this.clientID = _asInt32(clientID);
  }

  static int _asInt32(int value) {
    return (value & 0xFFFFFFFF).toSigned(32);
  }

  @override
  String toString() {

    return 'LoginResponse('
        'msgSize: $msgSize, '
        'messageHeader: ${messageHeader.toString()}, '
        'userName: ${utf8.decode(userName).trim()}, '
        'password: ${utf8.decode(password).trim()}, '
        'loginType: $loginType, '
        'nTokenCount: $nTokenCount, '
        'strategyType: $strategyType, '
        'clientID: $clientID'
        ')';
  }
}
// // Define the LoginResponse class
// class LoginResponse {
//   late final int msgSize;
//   late final ResponseMessageHeader? messageHeader;
//   // final List<int> userName;    // Size of 50
//   // final List<int> password;    // Size of 10
//   late final String password;
//   late final String userName;
//   late final int loginType;
//   late final int nTokenCount;
//   late final int strategyType;
//   late final int clientID;
//
//   LoginResponse({
//      required msgSize,
//      required messageHeader,
//      required userName,
//      required password,
//      required loginType,
//      required nTokenCount,
//      required strategyType,
//      required clientID,
//   }){
//     this.msgSize;
//     this.messageHeader;
//     this.userName;
//     this.password;
//     this.loginType;
//     this.nTokenCount;
//     this.strategyType;
//     this.clientID;
//   }
//
//   @override
//   String toString() {
//     return 'LoginResponse('
//         'msgSize: $msgSize, '
//         'messageHeader: ${messageHeader?.toString() ?? "null"}, '
//         'userName: $userName, '
//         'password: $password, '
//         'loginType: $loginType, '
//         'nTokenCount: $nTokenCount, '
//         'strategyType: $strategyType, '
//         'clientID: $clientID'
//         ')';
//   }

  //
  // factory LoginResponse.initialize({
  //    int? msgSize,
  //    ResponseMessageHeader? header,
  //   // required List<int> userName,
  //   // required List<int> password,
  //    String? password,
  //    String? userName,
  //    int? loginType,
  //    int? nTokenCount,
  //    int? strategyType,
  //    int? clientID,
  // }) {
  //   return LoginResponse(
  //     msgSize: msgSize,
  //     messageHeader: header,
  //     // userName: _padList(userName, 50),
  //     // password: _padList(password, 10),
  //     userName: userName,
  //     password: password,
  //     loginType: loginType,
  //     nTokenCount: nTokenCount,
  //     strategyType: strategyType,
  //     clientID: clientID,
  //   );
  // }




// Create a new class to hold only the extracted data
class Loginuserdata {
  final int? clientID;
  final int? loginType;
  final int? versionNo;

  Loginuserdata({
    this.clientID,
    this.loginType,
    this.versionNo,
  });

  @override
  String toString() {
    return 'Loginuserdata(clientID: $clientID, loginType: $loginType, versionNo: $versionNo)';
  }
}
