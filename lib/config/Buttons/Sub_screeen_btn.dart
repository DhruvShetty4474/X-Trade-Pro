import 'dart:developer';

import 'package:flutter/material.dart';

// BTN for About (Close), Add Record(Add record, Cancel)...
class SubScreeenBtnBTN extends StatefulWidget {
  const SubScreeenBtnBTN({super.key, required this.text, required this.dialogWidth, required this.dialogHeight, required this.size});
  final String text;
  final double dialogWidth;
  final double dialogHeight;
  final double size;


  @override
  State<SubScreeenBtnBTN> createState() => _SubScreeenBtnBTNState();
}

class _SubScreeenBtnBTNState extends State<SubScreeenBtnBTN> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // minimumSize: Size(120, 50),
          minimumSize: Size(widget.dialogWidth, widget.dialogHeight)
        // minimumSize: Size(180, 50),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.dialogWidth * widget.size,//0.13
          color: Colors.white,
        ),
      ),
    );
  }
}




class RecordManager_btn extends StatefulWidget {
  const RecordManager_btn({super.key, required this.text, required this.dialogWidth, required this.dialogHeight, required this.color});
  final String text;
  final double dialogWidth;
  final double dialogHeight;
  final Color color;

  @override
  State<RecordManager_btn> createState() => _RecordManager_btnState();
}

class _RecordManager_btnState extends State<RecordManager_btn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log(widget.text);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          // minimumSize: Size(120, 50),
          minimumSize: Size(widget.dialogWidth, widget.dialogHeight)
        // minimumSize: Size(180, 50),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.dialogWidth * 0.15,
          color: Colors.white,
        ),
      ),
    );
  }
}
