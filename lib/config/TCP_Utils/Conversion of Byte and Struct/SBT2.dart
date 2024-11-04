import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'Structures.dart';


// Define the RequestMessageHeader struct
// final class RequestMessageHeader extends Struct {
//   @Int32()
//   external int MsgCode;
//
//   @Int32()
//   external int ErrorCode;
//
//   @Int32()
//   external int VersionNo;
//
//   void initialize({
//     required int msgCode,
//     required int errorCode,
//     required int versionNo,
//   }) {
//     MsgCode = msgCode;
//     ErrorCode = errorCode;
//     VersionNo = versionNo;
//   }
// }

// Define the LoginRequest struct
// final class LoginRequest extends Struct {
//   @Int32()
//   external int msgSize;
//
//   external RequestMessageHeader messageHeader;
//
//   @Array(50)
//   external Array<Uint8> UserName;
//
//   @Array(10)
//   external Array<Uint8> Password;
//
//   @Int32()
//   external int LoginType;
//
//   // Updated initialize method without padding
//   void initialize({
//     required int msgSize,
//     required Pointer<RequestMessageHeader> header,
//     required List<int> userName,
//     required List<int> password,
//     required int loginType,
//   }) {
//     this.msgSize = msgSize;
//     messageHeader.MsgCode = header.ref.MsgCode;
//     messageHeader.ErrorCode = header.ref.ErrorCode;
//     messageHeader.VersionNo = header.ref.VersionNo;
//
//     final nullChar = '\0'.codeUnitAt(0);
//
//     // Copy UserName without padding
//     for (int i = 0; i < 50; i++) {
//       UserName[i] = i < userName.length ? userName[i] : nullChar;
//     }
//
//     // Copy Password without padding
//     for (int i = 0; i < 10; i++) {
//       Password[i] = i < password.length ? password[i] : nullChar;
//     }
//
//     this.LoginType = loginType;
//   }
// }




// Convert a LoginRequest struct to a byte array


//

//// Convert a LoginRequest struct to a byte array

// Convert a LoginRequest struct to a byte array
Uint8List structToBytes(Pointer<LoginRequest> pointer) {
  int structSize = sizeOf<LoginRequest>();
  return pointer.cast<Uint8>().asTypedList(structSize);
}

// Convert a byte array to a LoginRequest struct
Pointer<LoginRequest> bytesToStruct(Uint8List data) {
  if (data.length != sizeOf<LoginRequest>()) {
    throw ArgumentError('Data length does not match struct size.');
  }

  Pointer<LoginRequest> pointer = calloc<LoginRequest>();
  pointer.cast<Uint8>().asTypedList(data.length).setAll(0, data);
  return pointer;
}

// Convert bytes to string, removing padding
String bytesToString(Array<Uint8> byteArray, int maxLength) {
  List<int> byteList = [];
  for (int i = 0; i < maxLength; i++) {
    if (byteArray[i] != '\0'.codeUnitAt(0)) {
      byteList.add(byteArray[i]);
    } else {
      break;  // Stop at the first null byte
    }
  }
  return String.fromCharCodes(byteList);
}


//
// void main() {
//   // Allocate memory for the RequestMessageHeader
//   Pointer<RequestMessageHeader> headerPtr = calloc<RequestMessageHeader>();
//   headerPtr.ref.initialize();
//
//   // Allocate and initialize the login request struct
//   Pointer<LoginRequest> loginRequestPtr = calloc<LoginRequest>();
//   try {
//     loginRequestPtr.ref.initialize(
//       msgSize: sizeOf<LoginRequest>(),
//       header: headerPtr,
//       userName: 'USER10'.codeUnits, // No padding applied
//       password: 'Password@1'.codeUnits, // No padding applied
//       loginType: 1,
//     );
//
//     // Convert the LoginRequest struct into a byte array
//     Uint8List byteArray = structToBytes(loginRequestPtr);
//     print('Byte Array: $byteArray');
//
//     // Convert the byte array back into a LoginRequest struct
//     Pointer<LoginRequest> convertedRequestPtr = bytesToStruct(byteArray);
//     LoginRequest convertedRequest = convertedRequestPtr.ref;
//     print('Converted LoginRequest - msgSize: ${convertedRequest.msgSize}');
//     print('Message Header - MsgCode: ${convertedRequest.messageHeader.MsgCode}');
//     print('Message Header - ErrorCode: ${convertedRequest.messageHeader.ErrorCode}');
//     print('Message Header - VersionNo: ${convertedRequest.messageHeader.VersionNo}');
//
//     // Convert UserName and Password without using a loop
//     String userName = bytesToString(convertedRequest.UserName, 50); // Function handles removing null bytes
//     String password = bytesToString(convertedRequest.Password, 10); // Function handles removing null bytes
//
//     print('UserName: $userName');
//     print('Password: $password');
//     print('LoginType: ${convertedRequest.LoginType}');
//   } finally {
//     calloc.free(headerPtr);
//     calloc.free(loginRequestPtr);
//   }
// }

