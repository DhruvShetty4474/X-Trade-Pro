import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:buttons_flutter/buttons_flutter.dart';
import 'package:login_test1/Screen/Login/login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../Screen/Screens.dart';


class WorkstationLoginButton extends StatefulWidget {
  const WorkstationLoginButton({super.key});

  @override
  State<WorkstationLoginButton> createState() => _WorkstationLoginButtonState();
}

class _WorkstationLoginButtonState extends State<WorkstationLoginButton> {
  @override

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.blue[400],
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory,
        padding: EdgeInsets.fromLTRB(10, 15, 44, 15),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        )
      ),
      child: Row(
        children: [
          Icon(
            MdiIcons.accountCircle,
            size: 40,
          ),
          SizedBox(width: 8),
          Text(
              'Login',
            style: TextStyle(
              fontSize: 18
            ),
          )
        ],
      ) ,
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => LoginScreen()),
        showLoginDialog(context);
        // );
      },
    );
  }
  //
  }



//After WS login,,,,

class WS_Logout_BTW extends StatefulWidget {
  const WS_Logout_BTW({super.key});

  @override
  State<WS_Logout_BTW> createState() => WS_Logout_BTWState();
}

class WS_Logout_BTWState extends State<WS_Logout_BTW> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
          padding: EdgeInsets.fromLTRB(10, 15, 21, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          )
      ),
      child: Row(
        children: [
          Icon(
            MdiIcons.accountCircle,
            size: 40,
          ),
          SizedBox(width: 8),
          Text(
            'PROFILE',
            style: TextStyle(
                fontSize: 18
            ),
          )
        ],
      ) ,
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => LoginScreen()),
        log("USER LOGGED OUT");
        // );
      },
    );
  }
}




//Notifiaction BTN
class Notification_All_Message_BTW extends StatefulWidget {
  const Notification_All_Message_BTW({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<Notification_All_Message_BTW> createState() => _Notification_All_Message_BTWState();
}

class _Notification_All_Message_BTWState extends State<Notification_All_Message_BTW> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          // padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          )
      ),
      child: Text(
        'All Messages'
      ),
      onPressed: widget.onTap,
    );
  }
}

class Notification_Cross_Message_BTW extends StatefulWidget {
  const Notification_Cross_Message_BTW({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<Notification_Cross_Message_BTW> createState() => _Notification_Cross_Message_BTWState();
}

class _Notification_Cross_Message_BTWState extends State<Notification_Cross_Message_BTW> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          // padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          )
      ),
      child: Text(
          'Other Messages'
      ),
      onPressed: widget.onTap,
    );
  }
}

class Notification_Marked_Message_BTW extends StatefulWidget {
  const Notification_Marked_Message_BTW({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<Notification_Marked_Message_BTW> createState() => _Notification_Marked_Message_BTWState();
}

class _Notification_Marked_Message_BTWState extends State<Notification_Marked_Message_BTW> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          // padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          )
      ),
      child: Text(
          'Market Messages'
      ),
      onPressed: widget.onTap,
    );
  }
}



