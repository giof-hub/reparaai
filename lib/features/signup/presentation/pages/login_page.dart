import 'package:flutter/material.dart';
import 'package:reparaai/presentation/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage(this.controller);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _acessar() {
    // ignore: avoid_print
    print('Clicou em Acessar');
  }

  void _criarConta() {
    Navigator.pushNamed(context, '/cadastro');
  }

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
                      Image.network(
                        'https://i.imgur.com/0DbRqGA.png',
                        width: 158,
                        height: 164,
                      ),
                      const SizedBox(height: 40),
                      _campoDeTextoLogin('Informe seu e-mail', false),
                      const SizedBox(height: 20),
                      _campoDeTextoLogin('Senha', true),
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
                      _botaoPrincipal('Acessar', _acessar),
                      const SizedBox(height: 10),
                      _botaoPrincipal('Criar minha conta', _criarConta),
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

  Widget _campoDeTextoLogin(String hint, bool isPassword) {
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

  Widget _botaoPrincipal(String texto, VoidCallback onPressed) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF094A76),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
