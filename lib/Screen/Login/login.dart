import 'package:flutter/material.dart';
import '../Screens.dart';//instead create a config.dart.
import 'login_page_ui.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.dialogWidth, required this.dialogHeight});
  final double dialogWidth;//the Dialog Screen width.
  final double dialogHeight;// the Dialog Screen height.

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //Will change the size of the AppBar.
        preferredSize: Size.fromHeight(widget.dialogWidth * 0.07),
        child: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: TextLabel(dialogWidth: widget.dialogWidth, label: 'Welcome to X-TradePro', size: 0.04,),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.close,
                size: widget.dialogWidth* 0.05,
                color: Colors.black,),
              onPressed: (){
                Navigator.of(context).pop();
              }, )
          ],
          automaticallyImplyLeading: false,
        ),
      ),
      body:Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bg_image_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            //login overlay...
            LoginPageUi(dialogWidth: widget.dialogWidth, dialogHeight: widget.dialogHeight),
          ]
      ),

    );
  }
}