import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';



class TimePanel extends StatefulWidget {
  const TimePanel({super.key});

  @override
  State<TimePanel> createState() => _TimePanelState();
}

class _TimePanelState extends State<TimePanel> {
  late Timer _timer;
  late DateTime _time;

  @override
  void initState() {
    super.initState();
    _time = DateTime.now();

    _timer = Timer.periodic(Duration(seconds: 1), (Timer){
      setState(() {
        _time = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm:ss a').format(_time);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.5, vertical: 14),
      color: Colors.grey[400],
      // padding: EdgeInsets.fromLTRB(0, 15, 20, 2),
      child: Text(
        formattedTime,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }}


class WS_TimePanel extends StatefulWidget {
  const WS_TimePanel({super.key});

  @override
  State<WS_TimePanel> createState() => _WS_TimePanelState();
}

class _WS_TimePanelState extends State<WS_TimePanel> {
  late Timer _timer;
  late DateTime _time;

  @override
  void initState() {
    super.initState();
    _time = DateTime.now();

    _timer = Timer.periodic(Duration(seconds: 1), (Timer){
      setState(() {
        _time = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('hh:mm:ss a').format(_time);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.5, vertical: 5),
      color: Colors.grey[400],
      // padding: EdgeInsets.fromLTRB(0, 15, 20, 2),
      child: Text(
        formattedTime,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
