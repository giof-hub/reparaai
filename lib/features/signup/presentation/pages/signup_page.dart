import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';

class SignupPage extends StatefulWidget {
  static const String nameRoute = "signup";

  final SignupController controller;

  const SignupPage({super.key, required this.controller});

  @override
  _SignupPageState createState() => _SignupPageState(controller, true);
}

class _SignupPageState extends BasePageState<SignupPage, SignupController> {
  
  _SignupPageState(super.controller, super.hasAuthenticate);

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
