import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
class TCPClient{
  Socket? _socket;
  final String serverAddress;
  final int serverPort;

  TCPClient(this.serverAddress, this.serverPort);


  Future<bool> connect() async{
    try{
      _socket= await Socket.connect(serverAddress, serverPort);
      print('Connected to: ${_socket!.remoteAddress.address}:${_socket!.remotePort}');


      // Send a request to the server
      String request = 'Hello from client';
      _socket?.write(request);
      print('Request sent: $request');

      // Listen for the server's response
      _socket?.listen((Uint8List data) {
        String response = String.fromCharCodes(data);
        print('Response from server: $response');
      });
      return true;
    }catch(e){
      print('Unable to connect: $e');
      return false;
    }
  }

  void disconnect(){
    if(_socket!=null){
      _socket!.destroy(); //destory the connection
      print('Disconnected from the server');
      _socket = null;
    }
  }


  //WORK IN PROCESS.......... REQUEST SEND......
  // Future<void> sendRequest(String request) async {
  //   String request = "HELLO";
  //   if (_socket == null) {
  //     throw Exception('Socket is not connected');
  //   }
  //
  //   try {
  //     _socket!.write(request);
  //     print('Sent request: $request');
  //   } catch (e) {
  //     print('Error sending request: $e');
  //   }
  // }





}