import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/features/signup/domain/entities/signup_entity.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_doc_controller.dart';

class SignupDocPage extends StatefulWidget {
  static const String nameRoute = "signup_doc";

  final SignupDocController controller;

  final SignupEntity signupEntity;

  const SignupDocPage({super.key, required this.controller, required this.signupEntity});

  @override
  _SignupDocPageState createState() => _SignupDocPageState(controller, false);
}

class _SignupDocPageState extends BasePageState<SignupDocPage, SignupDocController> {
  
  _SignupDocPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    controller.setSignUp(widget.signupEntity);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
