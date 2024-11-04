// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:login_test1/Test/TCP/SBT.dart';
// import 'package:login_test1/Test/TCP/test_Str.dart';
//
// import 'strct_size_cal.dart'; // Assuming this contains your LoginRequest and related structures
//
// class TCPClient {
//   Socket? _socket;
//   final String serverAddress;
//   final int serverPort;
//
//   TCPClient(this.serverAddress, this.serverPort); // Server address and port
//
//   Future<bool> connect() async {
//     try {
//       // Create a socket connection to the server
//       _socket = await Socket.connect(serverAddress, serverPort);
//       // Printing the IP and port
//       print('Connected to: ${_socket!.remoteAddress.address}:${_socket!.remotePort}');
//       return true;
//     } catch (e) {
//       // When connection fails, print the error
//       print('Unable to connect: $e');
//       return false;
//     }
//   }
//
//   Future<void> loginRequest() async {
//     if (_socket == null) {
//       throw Exception('Socket is not connected');
//     }
//     try {
//       // Calculate the sizes
//       int userNameLength = 50; // Fixed size for userName
//       int passwordLength = 10; // Fixed size for password
//
//       // Calculate msgSize using the previously defined function
//       int _msgSize = calculateLoginRequestSize(
//         userNameLength: userNameLength,
//         passwordLength: passwordLength,
//       );
//
//       // Create a sample LoginRequest object
//       LoginRequest request = LoginRequest(
//         msgSize: _msgSize,
//         messageHeader: RequestMessageHeader.defaultHeader(),
//         userName: utf8.encode('USER10'),
//         password: utf8.encode('Password@1'),
//         loginType: 1,
//       );
//
//       // Convert the LoginRequest to a byte array
//       Uint8List byteArray = loginRequestToBytes(request);
//
//       // Send the byte array through the socket
//       _socket!.add(byteArray);
//       await _socket!.flush();
//       print('Sent ${byteArray.length} bytes');
//       print('Raw byte array sent: ${byteArray}');
//
//     } catch (e) {
//       print('Error sending request: $e');
//     }
//   }
//
//
//   // Future<Uint8List?> receiveRawResponse() async {
//   //   if (_socket == null) {
//   //     throw Exception('Socket is not connected');
//   //   }
//   //
//   //   try {
//   //     // Listen for the response
//   //     Uint8List responseBytes = await _socket!.first;
//   //     print('Received ${responseBytes.length} bytes');
//   //     print('Raw byte array received: $responseBytes');
//   //
//   //     return responseBytes;
//   //   } catch (e) {
//   //     print('Error receiving response: $e');
//   //     return null;
//   //   }
//   // }
//   // Future<LoginResponse?> receiveResponse() async {
//   //   if (_socket == null) {
//   //     throw Exception('Socket is not connected');
//   //   }
//   //
//   //   try {
//   //     Uint8List responseBytes = await _socket!.first;
//   //     print('Received ${responseBytes.length} bytes');
//   //     print('Raw byte array received: $responseBytes');
//   //
//   //     ByteData byteData = ByteData.sublistView(responseBytes);
//   //     int offset = 0;
//   //
//   //     // Parse msgSize
//   //     int msgSize = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //
//   //     // Parse MessageHeader
//   //     int packetSize = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //     int msgCode = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //     int errorCode = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //     int versionNo = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //
//   //     ResponseMessageHeader header = ResponseMessageHeader(
//   //       packetSize: packetSize,
//   //       msgCode: msgCode,
//   //       errorCode: errorCode,
//   //       versionNo: versionNo,
//   //     );
//   //
//   //     // Parse userName (50 bytes)
//   //     List<int> userName = responseBytes.sublist(offset, offset + 50);
//   //     offset += 50;
//   //
//   //     // Parse password (10 bytes)
//   //     List<int> password = responseBytes.sublist(offset, offset + 10);
//   //     offset += 10;
//   //
//   //     // Parse other fields
//   //     int loginType = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //     int nTokenCount = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //     int strategyType = byteData.getInt32(offset, Endian.little);
//   //     offset += 4;
//   //     int clientID = byteData.getInt32(offset, Endian.little);
//   //
//   //     return LoginResponse(
//   //       msgSize: msgSize,
//   //       messageHeader: header,
//   //       userName: userName,
//   //       password: password,
//   //       loginType: loginType,
//   //       nTokenCount: nTokenCount,
//   //       strategyType: strategyType,
//   //       clientID: clientID,
//   //     );
//   //
//   //   } catch (e) {
//   //     print('Error receiving response: $e');
//   //     return null;
//   //   }
//   //  }
//   Future<LoginResponse?> receiveResponse() async {
//     if (_socket == null) {
//       throw Exception('Socket is not connected');
//     }
//
//     try {
//       Uint8List responseBytes = await _socket!.first;
//       print('Received ${responseBytes.length} bytes');
//       print('Raw byte array received: $responseBytes');
//
//       // Use the bytesToLoginRequest function to parse the received data
//       LoginResponse loginResponse = bytesToLoginResponse(responseBytes);
//
//       // Extract the relevant information from the LoginRequest
//       // String userName = utf8.decode(loginResponse.userName).trim();
//       // String password = utf8.decode(loginResponse.password).trim();
//
//       return LoginResponse(
//         msgSize: loginResponse.msgSize,
//         messageHeader: ResponseMessageHeader(
//           packetSize: loginResponse.messageHeader.msgCode, // Assuming packetSize corresponds to msgCode
//           msgCode: loginResponse.messageHeader.msgCode,
//           errorCode: loginResponse.messageHeader.errorCode,
//           versionNo: loginResponse.messageHeader.versionNo,
//         ),
//         userName: loginResponse.userName,
//         password: loginResponse.password,
//         loginType: loginResponse.loginType,
//         nTokenCount: 0, // This field is not present in LoginRequest, set a default value
//         strategyType: 0, // This field is not present in LoginRequest, set a default value
//         clientID: 0, // This field is not present in LoginRequest, set a default value
//       );
//     } catch (e) {
//       print('Error receiving response: $e');
//       return null;
//     }
//   }
//   Future<void> disconnect() async {
//     await _socket?.close();
//     print('Disconnected from server');
//   }
// }
//
// void main() async {
//   try {
//     TCPClient client = TCPClient('192.168.29.220', 8888);//'175.100.176.182', 50006 || '192.168.29.220', 8888
//     bool isConnected = await client.connect();
//     if (isConnected) {
//       try {
//         await client.loginRequest();
//         print('Login request sent');
//
//         LoginResponse? response = await client.receiveResponse();
//         if (response != null) {
//           print('Received response:');
//           print(response.toString());
//         } else {
//           print('No response received');
//         }
//       } catch (e) {
//         print('Error during login process: $e');
//       } finally {
//         await Future.delayed(Duration(seconds: 2));
//         await client.disconnect();
//       }
//     }
//   } catch (e) {
//     print('Unable to connect: $e');
//   }
// }
