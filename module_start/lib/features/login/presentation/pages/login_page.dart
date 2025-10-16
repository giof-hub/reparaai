import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:module_design_system/gen/assets.dart';
import 'package:module_design_system/presentation/widget/button_field.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_button_field_widget.dart';

class LoginPage extends StatefulWidget {
  static const String nameRoute = "login";
  final LoginController controller;

  LoginPage({required this.controller, super.key});

  @override
  _LoginPageState createState() => _LoginPageState(controller, false);
}

class _LoginPageState extends BasePageState<LoginPage, LoginController> {
  
  _LoginPageState(super.controller, super.hasAuthenticate);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF287BA8),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image.asset('assets/logo.png', width: 158, height: 164),
                      AssetGenImage('assets/logo.png').toImage(width: 158, height: 164),
                      const SizedBox(height: 40),
                      LoginButtonField(
                        isPassword: false,
                        hint: 'Informe seu e-mail',
                        loginController: controller.emailController,
                      ),
                      const SizedBox(height: 20),
                      LoginButtonField(
                        isPassword: true,
                        hint: 'Senha',
                        loginController: controller.passwordController,
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueci minha senha?',
                          style: TextStyle(
                            color: Colors.white70,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ButtonField(
                        onPressed: () => controller.signin(),
                        text: 'Acessar',
                      ),
                      const SizedBox(height: 10),
                      ButtonField(
                        onPressed: () => controller.signup(),
                        text: 'Criar minha conta',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'COPYRIGHT © ${DateTime.now().year} BY REPARAI',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
