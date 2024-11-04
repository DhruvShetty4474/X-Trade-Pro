import 'package:flutter/material.dart';

class AddrecordsTextfeild extends StatefulWidget {
  const AddrecordsTextfeild({super.key, required this.text, required this.dialogWidth, required this.dialogHeight, required this.size});
  final double dialogWidth;
  final double dialogHeight;
  final String text;
  final double size;

  @override
  State<AddrecordsTextfeild> createState() => _AddrecordsTextfeildState();
}

class _AddrecordsTextfeildState extends State<AddrecordsTextfeild> {

  final ValueNotifier<bool> _isTextEmpty = ValueNotifier<bool>(true);

  // @override
  // void initState(){
  //   super.initState();
  //   widget.controller.addListener((){
  //     _isTextEmpty.value = widget.controller.text.isEmpty;
  //   }
  //   );
  // }

  @override
  // void dispose() {
  //   widget.controller.dispose();
  //   _isTextEmpty.dispose();
  //   super.dispose();
  // }
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.dialogHeight,
      width: widget.dialogWidth,
        child: ValueListenableBuilder<bool>(
        valueListenable: _isTextEmpty,
        builder: (context, isTextEmpty, child) {
      return TextField(
        cursorHeight: widget.dialogHeight * 0.6,
        cursorColor: Colors.black,
        style: TextStyle(
          fontSize: widget.dialogWidth * widget.size,  // Responsive font size
          color: Colors.black,
        ),
        // controller: widget.controller,
        decoration: InputDecoration(
          //have to integrate text label responsiveness.....
          labelText: isTextEmpty? widget.text: null,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.black), // Color when focused
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
        ),
      );
        }
      ),
    );
  }
}
