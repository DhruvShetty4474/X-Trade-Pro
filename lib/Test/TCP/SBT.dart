import 'dart:typed_data';
import 'package:login_test1/Test/TCP/test_Str.dart';
 // Import the LoginRequest structure

// Convert a LoginRequest struct to a byte array
Uint8List loginRequestToBytes(LoginRequest request) {
  final ByteData byteData = ByteData(4 * 4 + 50 + 10 + 4); // Calculate size
  int offset = 0;

  // Write msgSize
  byteData.setInt32(offset, request.msgSize, Endian.little);
  offset += 4;

  // Write messageHeader
  byteData.setInt32(offset, request.messageHeader.msgCode, Endian.little);
  offset += 4;
  byteData.setInt32(offset, request.messageHeader.errorCode, Endian.little);
  offset += 4;
  byteData.setInt32(offset, request.messageHeader.versionNo, Endian.little);
  offset += 4;

  // Write userName (padded to 50 bytes)
  for (int i = 0; i < 50; i++) {
    byteData.setUint8(offset++, i < request.userName.length ? request.userName[i] : 0);
  }

  // Write password (padded to 10 bytes)
  for (int i = 0; i < 10; i++) {
    byteData.setUint8(offset++, i < request.password.length ? request.password[i] : 0);
  }

  // Write loginType
  byteData.setInt32(offset, request.loginType, Endian.little);

  return byteData.buffer.asUint8List();
}

// Convert a byte array back to a LoginRequest struct
LoginRequest bytesToLoginRequest(Uint8List data) {
  if (data.length != 80) { // 4 * 4 + 50 + 10 + 4 = 80
    throw ArgumentError('Data length does not match struct size. Expected 80, got ${data.length}');
  }

  final ByteData byteData = ByteData.sublistView(data);
  int offset = 0;

  // Read msgSize
  int msgSize = byteData.getInt32(offset, Endian.little);
  offset += 4;

  // Read messageHeader
  RequestMessageHeader messageHeader = RequestMessageHeader(
    msgCode: byteData.getInt32(offset, Endian.little),
    errorCode: byteData.getInt32(offset + 4, Endian.little),
    versionNo: byteData.getInt32(offset + 8, Endian.little),
  );
  offset += 12;

  // Read userName
  List<int> userName = data.sublist(offset, offset + 50);
  offset += 50;

  // Read password
  List<int> password = data.sublist(offset, offset + 10);
  offset += 10;

  // Read loginType
  int loginType = byteData.getInt32(offset, Endian.little);

  return LoginRequest(
    msgSize: msgSize,
    messageHeader: messageHeader,
    userName: userName,
    password: password,
    loginType: loginType,
  );
}



LoginResponse bytesToLoginResponse(Uint8List data){
  if (data.length != 100) { // 4 * 4 + 50 + 10 + 4 = 80
    throw ArgumentError('Data length does not match struct size. Expected 80, got ${data.length}');
  }
  ByteData byteData = ByteData.sublistView(data);
  int offset = 0;

  int msgSize = byteData.getInt32(offset, Endian.little);
  offset += 4;

  // Parse MessageHeader
  int packetSize = byteData.getInt32(offset, Endian.little);
  offset += 4;
  int msgCode = byteData.getInt32(offset, Endian.little);
  offset += 4;
  int errorCode = byteData.getInt32(offset, Endian.little);
  offset += 4;
  int versionNo = byteData.getInt32(offset, Endian.little);
  offset += 4;

  ResponseMessageHeader header = ResponseMessageHeader(
    packetSize: packetSize,
    msgCode: msgCode,
    errorCode: errorCode,
    versionNo: versionNo,
  );

  // Parse userName (50 bytes)
  List<int> userName = data.sublist(offset, offset + 50);
  offset += 50;

  // Parse password (10 bytes)
  List<int> password = data.sublist(offset, offset + 10);
  offset += 10;

  // Parse other fields
  int loginType = byteData.getInt32(offset, Endian.little);
  offset += 4;
  int nTokenCount = byteData.getInt32(offset, Endian.little);
  offset += 4;
  int strategyType = byteData.getInt32(offset, Endian.little);
  offset += 4;
  int clientID = byteData.getInt32(offset, Endian.little);

  return LoginResponse(
    msgSize: msgSize,
    messageHeader: header,
    userName: userName,
    password: password,
    loginType: loginType,
    nTokenCount: nTokenCount,
    strategyType: strategyType,
    clientID: clientID,
  );

}
