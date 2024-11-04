import 'package:flutter/material.dart';
import '../Screens.dart';

// Login Screen Dialog Screen
class LoginScreenDialog extends StatefulWidget {
  const LoginScreenDialog({super.key});

  @override
  State<LoginScreenDialog> createState() => _LoginScreenDialogState();
}

class _LoginScreenDialogState extends State<LoginScreenDialog> {
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    final dialogWidth = screenSize.width * 0.4;
    final dialogHeight = screenSize.height * 0.53;

    // Calculate the position to center the dialog
    final dialogTop = (screenSize.height - dialogHeight) / 2 - 80;
    final dialogRight = (screenSize.width - dialogWidth) / 2.3;

    return Stack(
      children: [
        Positioned(
          top: dialogTop,
          right: dialogRight,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              width: dialogWidth,
              height: dialogHeight,
              child: LoginScreen(dialogWidth: dialogWidth, dialogHeight: dialogHeight,),
            ),
          ),
        ),
      ],
    );
  }
}

void showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => const LoginScreenDialog(),
  );
}

// Have to implement delay for login screen pop up

// void showLoginDialog(BuildContext context) {
//   // Delay of 2 seconds before showing the dialog
//   Future.delayed(const Duration(seconds: 2), () {
//     if (context.mounted) {
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) => const LoginScreenDialog(),
//       );
//     }
//   });
// }
