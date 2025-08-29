import 'dart:ui';

import 'package:flutter/material.dart';

class LoginButtonField extends StatelessWidget {
  final bool isPassword;
  final String hint;

  const LoginButtonField({
    super.key,
    required this.isPassword,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        obscureText: isPassword,
        obscuringCharacter: '•',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFFA1A1A1)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF094A76), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF094A76), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFF094A76), width: 2),
          ),
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
