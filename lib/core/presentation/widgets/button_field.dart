import 'package:flutter/material.dart';

class ButtonField extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color? backColor;
  final Color? foreColor;

  const ButtonField({
    super.key,
    required this.onPressed,
    required this.text,
    this.backColor,
    this.foreColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor ?? Color(0xFF094A76),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: foreColor ?? Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
