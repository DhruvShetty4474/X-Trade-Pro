import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'Screen/Screens.dart';
import 'config/TCP_Utils/control.dart';

void main() async{
  //To Set the application size
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  const windowSize = Size(1280, 780);//initializing the size to 1280x780 or can do 1980x1080.
  await windowManager.setSize(windowSize);//setting the initial size.
  await windowManager.setMinimumSize(windowSize);//setting the minimum size.

  // await windowManager.setMaximumSize(Size(1280, 780));//setting the maximum size of the application.

  // await WindowManager.instance.setFullScreen(true);//setting the application in fullscreen.

  runApp(const MyApp());//Executing the main application.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Login_in',
      debugShowCheckedModeBanner: false,//hiding the debug banner from right side.
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,//setting the Theme.
      ),
      // home: LoginScreen()//will take to the main home screen design only.

      home: Workstation(),//will take to the before login page.

      // home: WorkstationAfterlogin(),//will take to the after login page.

      // home: Control(),//will first execute the TCP socket which mostly be the first/main to be execurted.
    );
  }
}

