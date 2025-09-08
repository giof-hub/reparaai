import 'package:flutter/material.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';

class SignupPage extends StatefulWidget {
  static const String nameRoute = "signup";

  final SignupController controller;

  const SignupPage({required this.controller});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
