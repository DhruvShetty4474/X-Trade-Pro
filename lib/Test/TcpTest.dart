// import 'dart:io';
// import 'dart:typed_data';
// import 'package:ffi/ffi.dart';
// import 'dart:ffi';
// import 'dart:async';
//
// import '../config/TCP_Utils/Conversion of Byte and Struct/Structures.dart';
//
//
// // Assuming these are defined in '../config/TCP_Utils/TCp.dart'
//
//
// class TCPClient {
//   Socket? _socket;
//   final String serverAddress;
//   final int serverPort;
//   StreamSubscription? _subscription;
//   Completer<void>? _loginCompleter;
//
//   TCPClient(this.serverAddress, this.serverPort);
//
//   Future<bool> connect() async {
//     try {
//       _socket = await Socket.connect(serverAddress, serverPort);
//       print('Connected to: ${_socket!.remoteAddress.address}:${_socket!.remotePort}');
//       _startListening();
//       return true;
//     } catch (e) {
//       print('Unable to connect: $e');
//       return false;
//     }
//   }
//
//   void _startListening() {
//     _subscription = _socket!.listen(
//       _handleIncomingData,
//       onDone: _handleDisconnect,
//       onError: _handleError,
//       cancelOnError: false,
//     );
//   }
//
//   void disconnect() {
//     _loginCompleter?.complete();
//     _subscription?.cancel();
//     if (_socket != null) {
//       _socket!.close().then((_) {
//         print('Disconnected from the server');
//       }).catchError((e) {
//         print('Error closing socket: $e');
//       }).whenComplete(() {
//         _socket = null;
//       });
//     }
//   }
//
//   Future<void> sendLoginRequest(Pointer<LoginRequest> requestPtr) async {
//     if (_socket == null) {
//       throw Exception('Socket is not connected');
//     }
//
//     try {
//       int structSize = sizeOf<LoginRequest>();  // size of the struct
//       Uint8List byteArray = Uint8List(4 + structSize);  // 4 bytes for message type and length
//
//       // Construct the header
//       byteArray[0] = 1;  // Message type for login (assumed to be 1)
//       byteArray[1] = (structSize >> 16) & 0xFF;  // High byte of size
//       byteArray[2] = (structSize >> 8) & 0xFF;   // Middle byte of size
//       byteArray[3] = structSize & 0xFF;          // Low byte of size
//
//       // Copy the struct data into the byte array (after the header)
//       Uint8List structBytes = requestPtr.cast<Uint8>().asTypedList(structSize);
//       byteArray.setRange(4, 4 + structSize, structBytes);
//
//       // Send the byte array to the server
//       _socket!.add(byteArray);
//       await _socket!.flush();
//     print('Sent login request: ${byteArray.length} bytes');
//       print('Sent login request: ${byteArray} ');
//       _loginCompleter = Completer<void>();
//       return _loginCompleter!.future.timeout(
//         Duration(seconds: 30),
//         onTimeout: () {
//           print('Login request timed out');
//           _loginCompleter?.completeError(TimeoutException('Login request timed out'));
//         },
//       );
//     } catch (e) {
//       print('Error sending login request: $e');
//       rethrow;
//     }
//   }
//
//
//   void _handleIncomingData(Uint8List data) {
//     try {
//       if (data.isEmpty) {
//         print('Received empty data packet');
//         return;
//       }
//
//       int messageType = data[0];
//       print('Received message type: $messageType');
//
//       if (data.length < 4) {
//         print('Received incomplete header');
//         return;
//       }
//
//       int messageLength = (data[1] << 16) | (data[2] << 8) | data[3];
//       print('Message length: $messageLength');
//
//       if (data.length < messageLength + 4) {
//         print('Received incomplete message: expected ${messageLength + 4} bytes, got ${data.length} bytes');
//         return;
//       }
//
//       Uint8List messageData = data.sublist(4, messageLength + 4);
//
//       switch (messageType) {
//         case 12:  // Assuming 12 is the login response message type
//           _processLoginResponse(messageData);
//           break;
//         default:
//           print('Unknown message type: $messageType');
//       }
//     } catch (e) {
//       print('Error processing server response: $e');
//     }
//   }
//
//   void _processLoginResponse(Uint8List messageData) {
//     if (messageData.length < sizeOf<ResponseMessageHeader>()) {
//       print('Login response data too short');
//       _loginCompleter?.completeError(Exception('Invalid login response'));
//       return;
//     }
//
//     Pointer<ResponseMessageHeader> responsePtr = calloc<ResponseMessageHeader>();
//     try {
//       responsePtr.cast<Uint8>().asTypedList(sizeOf<ResponseMessageHeader>()).setAll(0, messageData);
//       ResponseMessageHeader response = responsePtr.ref;
//
//       print('Received login response:');
//       print('Packet Size: ${response.packetSize}');
//       print('Msg Code: ${response.msgCode}');
//       print('Error Code: ${response.errorCode}');
//       print('Version No: ${response.versionNo}');
//
//       if (response.errorCode == 0) {
//         print('Login successful');
//         _loginCompleter?.complete();
//       } else {
//         print('Login failed with error code: ${response.errorCode}');
//         _loginCompleter?.completeError(Exception('Login failed with error code: ${response.errorCode}'));
//       }
//     } finally {
//       calloc.free(responsePtr);
//     }
//   }
//
//   void _handleDisconnect() {
//     print('Server closed connection');
//     disconnect();
//   }
//
//   void _handleError(error) {
//     print('Error in socket connection: $error');
//     disconnect();
//   }
// }
//
// void main() async {
//   Pointer<LoginRequest> loginRequestPtr = calloc<LoginRequest>();
//   Pointer<RequestMessageHeader> headerPtr = calloc<RequestMessageHeader>();
//   try {
//     headerPtr.ref.initialize();
//     loginRequestPtr.ref.initialize(
//       msgSize: sizeOf<LoginRequest>(),
//       header: headerPtr,
//       userName: 'USER10'.padRight(50, '\u0000').codeUnits,
//       password: 'Password@1'.padRight(10, '\u0000').codeUnits,
//       loginType: 1,
//     );
//
//     TCPClient client = TCPClient('192.168.29.220', 8888);
//     bool isConnected = await client.connect();
//
//     if (isConnected) {
//       try {
//         await client.sendLoginRequest(loginRequestPtr);
//         print('Login request completed');
//       } catch (e) {
//         print('Error during login: $e');
//       } finally {
//         await Future.delayed(Duration(seconds: 2));
//         client.disconnect();
//       }
//     }
//   } finally {
//     calloc.free(loginRequestPtr);
//     calloc.free(headerPtr);
//   }
// }