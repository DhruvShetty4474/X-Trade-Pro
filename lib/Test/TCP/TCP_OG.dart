// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// // import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
// import 'dart:typed_data';
// import 'package:login_test1/Test/TCP/SBT.dart';
// import 'package:login_test1/Test/TCP/test_Str.dart';
// import '../../BU_LOGIC/Auth_version.dart';
// import '../../MODELS/LoginR.dart';
// import 'strct_size_cal.dart';
//
//
// typedef ConnectionStatusCallback = void Function(bool isConnected);
// typedef ErrorCallback = void Function(dynamic error);
//
//
// // Assuming this contains your LoginRequest and related structures
// class TCPClient {
//   Socket? _socket;
//   final String serverAddress;
//   final int serverPort;
//
//   TCPClient(this.serverAddress, this.serverPort); // Server address and port
//
//   // Callbacks for connection status and errors
//   ConnectionStatusCallback? onConnectionStatusChanged;
//   ErrorCallback? onError;
//
//   // Stream controllers for handling responses
//   final _responseController = StreamController<Uint8List>.broadcast();
//   Stream<Uint8List> get responseStream => _responseController.stream;
//
//   // Connection management
//   Timer? _keepAliveTimer;
//   bool _isDisposed = false;
//
//   Future<bool> connect() async {
//     if (_isDisposed) return false;
//
//     try {
//       // Close existing connection if any
//       await disconnect();
//       // Create a socket connection to the server
//       _socket = await Socket.connect(
//         serverAddress,
//         serverPort,
//         timeout: const Duration(seconds: 30),
//       );
//
//       // Set up socket listeners
//       _setupSocketListeners();
//
//       // Start keep-alive mechanism
//       _startKeepAlive();
//
//       // Printing the IP and port
//       print('Connected to: ${_socket!.remoteAddress.address}:${_socket!.remotePort}');
//       onConnectionStatusChanged?.call(true);
//       return true;
//
//
//     } catch (e) {
//       // When connection fails, print the error
//       print('Unable to connect: $e');
//       onError?.call(e);
//       onConnectionStatusChanged?.call(false);
//       return false;
//     }
//   }
//
//   void _setupSocketListeners(){
//     _socket?.listen(
//           (data){
//         if(!_isDisposed){
//           _responseController.add(data);
//         }
//       },
//       onError: (error){
//         print('Socket error: $error');
//         onError?.call(error);
//         _handleDisconnection();
//       },
//       onDone: _handleDisconnection,
//       cancelOnError: true,
//     );
//   }
//   void _handleDisconnection() {
//     if (!_isDisposed) {
//       print('Socket disconnected');
//       onConnectionStatusChanged?.call(false);
//     }
//   }
//
//   void _startKeepAlive() {
//     _keepAliveTimer?.cancel();
//     _keepAliveTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
//       if (_socket != null && !_isDisposed) {
//         sendKeepAlive();
//       }
//     });
//   }
//
//   Future<void> sendKeepAlive() async {
//     try {
//       // Implement your keep-alive packet structure here
//       await sendData(Uint8List.fromList([0x00])); // Simple keep-alive packet
//     } catch (e) {
//       print('Keep-alive error: $e');
//     }
//   }
//
//   Future<void> sendData(Uint8List data) async {
//     if (_socket == null || _isDisposed) {
//       throw Exception('Socket is not connected');
//     }
//
//     try {
//       _socket!.add(data);
//       await _socket!.flush();
//       print('Sent ${data.length} bytes');
//     } catch (e) {
//       print('Error sending data: $e');
//       onError?.call(e);
//       throw e;
//     }
//   }
//
//   Future<LoginResponse?> loginRequest() async {
//     if (_socket == null || _isDisposed) {
//       throw Exception('Socket is not connected');
//     }
//     try {
//
//       // Calculate the sizes
//       int userNameLength = 50; // Fixed size for userName
//       int passwordLength = 10; // Fixed size for password
//
//       // Calculate msgSize using the previously defined function
//       int _msgSize = calculateLoginRequestSize(
//         userNameLength: userNameLength,
//         passwordLength: passwordLength,
//       );
//       // Create a sample LoginRequest object
//       LoginRequest request = LoginRequest(
//         msgSize: _msgSize,
//         messageHeader: RequestMessageHeader.defaultHeader(),
//         userName: utf8.encode(),//The data should flow from FE.
//         password: utf8.encode(),//The data should flow from FE.
//         loginType: 1,//The data should flow from FE.
//       );
//
//
//       // Convert the LoginRequest to a byte array
//       Uint8List byteArray = loginRequestToBytes(request);
//       await sendData(byteArray);
//
//       // Send the byte array through the socket
//       // _socket!.add(byteArray);
//       // await _socket!.flush();
//       // print('Sent ${byteArray.length} bytes');
//       // print('Raw byte array sent: ${byteArray}');
//       final response = await receiveResponse();
//       return response;
//
//
//     } catch (e) {
//       print('Error sending request: $e');
//       onError?.call(e);
//       throw e;
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
//     if (_socket == null ||  _isDisposed) {
//       throw Exception('Socket is not connected');
//     }
//
//     try {
//       Uint8List responseBytes = await _socket!.first;
//       print('Received ${responseBytes.length} bytes');
//
//       print('Raw byte array received: $responseBytes');
//
//       // Use the bytesToLoginRequest function to parse the received data
//       LoginResponse loginResponse = bytesToLoginResponse(responseBytes);
//
//       // Extract the relevant information from the LoginRequest
//       String userName = utf8.decode(loginResponse.userName).trim();
//       String password = utf8.decode(loginResponse.password).trim();
//
//       // return LoginResponse(
//       //   msgSize: loginResponse.msgSize,
//       //   messageHeader: ResponseMessageHeader(
//       //     packetSize: loginResponse.messageHeader.msgCode, // Assuming packetSize corresponds to msgCode
//       //     msgCode: loginResponse.messageHeader.msgCode,
//       //     errorCode: loginResponse.messageHeader.errorCode,
//       //     versionNo: loginResponse.messageHeader.versionNo,
//       //   ),
//       //   userName: loginResponse.userName,
//       //   password: loginResponse.password,
//       //   loginType: loginResponse.loginType,
//       //   nTokenCount: 0, // This field is not present in LoginRequest, set a default value
//       //   strategyType: 0, // This field is not present in LoginRequest, set a default value
//       //   clientID: 0, // This field is not present in LoginRequest, set a default value
//       // );
//     } catch (e) {
//       print('Error receiving response: $e');
//       return null;
//     }
//   }
//   Future<void> disconnect() async {
//     _keepAliveTimer?.cancel();
//     _keepAliveTimer = null;
//
//     try {
//       await _socket?.close();
//       _socket = null;
//       onConnectionStatusChanged?.call(false);
//     } catch (e) {
//       print('Error during disconnect: $e');
//       onError?.call(e);
//     }
//   }
//
//   Future<void> dispose() async {
//     _isDisposed = true;
//     await disconnect();
//     await _responseController.close();
//   }
// }
//
//
// // void main() async {
// //   try {
// //     TCPClient client = TCPClient('192.168.29.220', 8888);//'175.100.176.182', 50006 || '192.168.29.220', 8888
// //     bool isConnected = await client.connect();
// //     if (isConnected) {
// //       try {
// //         await client.loginRequest();
// //         print('Login request sent');
// //
// //         LoginResponse? response = await client.receiveResponse();
// //         if (response != null) {
// //           print('Received response:');
// //           print(response.toString());
// //         } else {
// //           print('No response received');
// //         }
// //       } catch (e) {
// //         print('Error during login process: $e');
// //       } finally {
// //         await Future.delayed(Duration(seconds: 2));
// //         await client.disconnect();
// //       }
// //     }
// //   } catch (e) {
// //     print('Unable to connect: $e');
// //   }
// // }
