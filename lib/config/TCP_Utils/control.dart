// import 'dart:developer';
// import 'package:flutter/material.dart';
// // import 'package:window_manager/window_manager.dart';
// import '../../Screen/Screens.dart';
// import '../../Test/TCP/TCP.dart';
// // import 'TCP_t1.dart';
// import 'package:flutter/services.dart';
//
// enum ConnectionStatus {
//   disconnected,
//   connecting,
//   connected,
//   serverDown,
//   error
// }
//
// class Control extends StatefulWidget {
//   const Control({super.key});
//
//   @override
//   State<Control> createState() => _ControlState();
// }
//
// class _ControlState extends State<Control> with WidgetsBindingObserver {
//   ConnectionStatus _connectionStatus = ConnectionStatus.disconnected;
//   bool _isDisposing = false;
//   TCPClient? _client;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     // _setupWindowListners();
//     _connectToServer();
//   }
//
//   Future<void> _connectToServer() async {
//     if (_isDisposing) return;
//
//     setState(() {
//       _connectionStatus = ConnectionStatus.connecting;
//     });
//
//   //   _client = TCPClient('175.100.176.182', 50000);
//   //   bool connected;
//   //
//   //   try{
//   //     connected = await _client!.connect();
//   //     setState(() {
//   //       _connectionStatus = connected ? ConnectionStatus.connected : ConnectionStatus.serverDown;
//   //     });
//   //   }catch (e){
//   //     log("Error connecting to server: $e");
//   //     setState(() {
//   //       _connectionStatus = ConnectionStatus.serverDown;
//   //     });
//   //   }
//   //   if(_connectionStatus == ConnectionStatus.serverDown){
//   //     log("Server is down");
//   //   }
//   // }
//     try {
//       _client = TCPClient('192.168.29.220', 8888);
//       _client?.onConnectionStatusChanged = _handleConnectionStatusChange;
//       _client?.onError = _handleConnectionError;
//
//       final connected = await _client!.connect();
//       if (!mounted) return;
//
//       setState(() {
//         _connectionStatus = connected ? ConnectionStatus.connected : ConnectionStatus.serverDown;
//       });
//     } catch (e) {
//       log("Error initializing connection: $e");
//       if (!mounted) return;
//
//       setState(() {
//         _connectionStatus = ConnectionStatus.error;
//       });
//     }
//   }
//
//   void _handleConnectionStatusChange(bool isConnected){
//     if(!mounted || _isDisposing)return;
//
//     setState(() {
//       _connectionStatus = isConnected ? ConnectionStatus.connected : ConnectionStatus.disconnected;
//     });
//
//     if(!isConnected){
//       _attemptReconnection();
//     }
//   }
//
//   void _handleConnectionError(dynamic error){
//     if(!mounted || _isDisposing) return;
//
//     log("Connection error: $error");
//     setState(() {
//       _connectionStatus = ConnectionStatus.error;
//     });
//
//     _attemptReconnection();
//   }
//
//
//   Future<void> _attemptReconnection() async {
//     if (_isDisposing) return;
//
//     await Future.delayed(const Duration(seconds: 5));
//     if (!mounted || _isDisposing) return;
//
//     if (_connectionStatus != ConnectionStatus.connected) {
//       _connectToServer();
//     }
//   }
//
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (_isDisposing) return;
//
//     log("AppLifecycleState changed: $state");
//
//     // if(state == AppLifecycleState.inactive|| state == AppLifecycleState.paused){
//     //   if (_client != null && _connectionStatus == ConnectionStatus.connected) {
//     //     _client!.disconnect(); // Disconnect from the server
//     //     log("Disconnected from the server on app exit");
//     //   }
//     // }else if (state == AppLifecycleState.resumed) {
//     //   // Application is resumed
//     //   if (_client != null && _connectionStatus == ConnectionStatus.serverDown) {
//     //     _connectToServer(); // Attempt to reconnect if the server was down
//     //     log("Attempting to reconnect to the server");
//     //   }
//     // }
//     // super.didChangeAppLifecycleState(state);
//     switch (state) {
//       case AppLifecycleState.inactive:
//       case AppLifecycleState.paused:
//         _disconnectFromServer();
//         break;
//       case AppLifecycleState.resumed:
//         if (_connectionStatus != ConnectionStatus.connected) {
//           _connectToServer();
//         }
//         break;
//       default:
//         break;
//     }
//
//   }
//
//
//   Future<void> _disconnectFromServer() async {
//     if (_client != null && _connectionStatus == ConnectionStatus.connected) {
//       await _client!.disconnect();
//       if (!mounted || _isDisposing) return;
//
//       setState(() {
//         _connectionStatus = ConnectionStatus.disconnected;
//       });
//       log("Disconnected from the server");
//     }
//   }
//
//
//   @override
//   void dispose() {
//     _isDisposing = true;
//     WidgetsBinding.instance.removeObserver(this);
//     _disconnectFromServer();
//     super.dispose();
//   }
//
//
//   //Still working on this for window minimize, exit, resume..
//   // void _setupWindowListeners() {
//   //   windowManager.
//   // }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   switch (_connectionStatus){
//   //     case ConnectionStatus.connecting:
//   //       return Center(child: CircularProgressIndicator());
//   //
//   //     case ConnectionStatus.connected:
//   //       return Workstation();
//   //
//   //     case ConnectionStatus.serverDown:
//   //       return Center(child: Text("Unable to connect to the server. Server might be down."));
//   //
//   //     case ConnectionStatus.disconnected:
//   //
//   //     default:
//   //       return const SizedBox.shrink();
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       child: _buildContent(),
//     );
//   }
//
//   Widget _buildContent() {
//     switch (_connectionStatus) {
//       case ConnectionStatus.connecting:
//         return const Center(
//           key: ValueKey('connecting'),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 16),
//               Text("Connecting to server...")
//             ],
//           ),
//         );
//
//       case ConnectionStatus.connected:
//         return const Workstation(key: ValueKey('workstation'));
//
//       case ConnectionStatus.serverDown:
//       case ConnectionStatus.error:
//         return Center(
//           key: const ValueKey('error'),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Unable to connect to the server.",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _connectToServer,
//                 child: const Text("Retry Connection"),
//               ),
//             ],
//           ),
//         );
//
//       case ConnectionStatus.disconnected:
//       default:
//         return const SizedBox.shrink(key: ValueKey('empty'));
//     }
//   }
// }
