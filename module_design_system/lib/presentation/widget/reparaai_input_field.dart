import 'package:flutter/material.dart';

class ReparaaiInputField extends StatelessWidget{

  final TextEditingController controller;

  final String title;

  final String? subtitle;

  final InputDecoration? decoration;

  final bool obscureText;

  const ReparaaiInputField({
    super.key, 
    required this.controller,
    required this.title,
    this.subtitle,
    this.decoration,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),  
            ),
            SizedBox(width: 10),
            subtitle != null
            ? Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 12
                ),
              )
            : SizedBox.shrink()
          ],
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: decoration,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

}