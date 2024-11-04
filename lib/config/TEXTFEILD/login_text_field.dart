import 'package:flutter/material.dart';

//A Custom Text Field for Both USERNAME and PASSWORD.

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.dialogWidth,
    required this.dialogHeight,
    required this.labelText,
    this.isPassword = false }); //Determined as not visible at first.
  //initializing the parameters ( USERNAME or PASSWORD ).
  final TextEditingController controller;// Manages the text being edited.
  final double dialogWidth; // dialog box width.
  final double dialogHeight;//dialog box height.
  final String labelText; //The placeholder text shown when the field is empty ( USERNAME or PASSWORD )
  final bool isPassword; // Determines if this is a password field (with visibility toggle).

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  late ValueNotifier<bool> _isTextEmpty; //A ValueNotifier that tracks whether the text field is empty.
  bool _obscurePassword = true; //Tracks whether the password should be obscured/hidden (for password fields).

  // It initializes the _isTextEmpty notifier and adds a listener to the text controller.
  @override
  void initState() {
    super.initState();
    _isTextEmpty = ValueNotifier<bool>(widget.controller.text.isEmpty);
    widget.controller.addListener(_updateTextEmpty);
  }
 // Updates the _isTextEmpty notifier whenever the text changes.
  void _updateTextEmpty() {
    _isTextEmpty.value = widget.controller.text.isEmpty;
  }

  //removes listeners and disposing of the notifier.
  @override
  void dispose() {
    widget.controller.removeListener(_updateTextEmpty);
    _isTextEmpty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.dialogHeight * 0.08,
      width: widget.dialogWidth * 0.4,

      child: ValueListenableBuilder<bool>(
        valueListenable: _isTextEmpty,
        builder: (context, isTextEmpty, child) {

          return TextField(
            controller: widget.controller,
            obscureText: widget.isPassword && _obscurePassword,

              decoration: InputDecoration(
              labelText: isTextEmpty ? widget.labelText : null,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
        ),

        contentPadding: const EdgeInsets.symmetric(horizontal: 22.0),

        //This adds a visibility toggle button for password fields. When pressed, it toggles the _obscurePassword state.
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          icon: Icon(
          _obscurePassword ? Icons.visibility : Icons.visibility_off,
          size: widget.dialogHeight * 0.04,
        ),
        ):null,

          ),
          );
      },
      ),
    );
  }
}
