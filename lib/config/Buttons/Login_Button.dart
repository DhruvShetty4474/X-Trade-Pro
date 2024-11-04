import 'dart:developer';

import 'package:flutter/material.dart';


class LoginButton extends StatefulWidget {
  final VoidCallback onLogin;
  const LoginButton({super.key, required this.onLogin, required this.dialogWidth, required this.dialogHeight});
  final double dialogWidth;
  final double dialogHeight;


  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // login logic here
        widget.onLogin();

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(widget.dialogWidth * 0.2, widget.dialogHeight * 0.1),
      ),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: widget.dialogWidth * 0.03,
          color: Colors.white,
        ),
      ),
    );
  }
}
