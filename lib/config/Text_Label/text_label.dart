import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({super.key, required this.dialogWidth, required this.label, required this.size});
  final double dialogWidth;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: dialogWidth * size, //0.04
      ),
    );
  }
}
