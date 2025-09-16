import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/core/presentation/widgets/reparaai_input_field.dart';
import 'package:reparaai/features/signup/domain/entities/enums/account_type_enum.dart';
import 'package:reparaai/features/signup/domain/entities/signup_arguments.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';

class SignupPage extends StatefulWidget {
  static const String nameRoute = "signup";

  final SignupController controller;

  SignupArguments? args;

  SignupPage({super.key, required this.controller, this.args});

  @override
  _SignupPageState createState() => _SignupPageState(controller, false);
}

class _SignupPageState extends BasePageState<SignupPage, SignupController> {
  
  _SignupPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text("Cadastrar"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40, left: 16, right: 16),
        child: Form(
          key: controller.formKey,
          child: Observer(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: const Text(
                      "Nos informe alguns dados para que possamos melhorar a sua experiência na Construtech",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
              
                  ReparaaiInputField(
                    controller: controller.nameController, 
                    title: "Nome completo",
                    subtitle: "Como aparecerá seu nome em seus anúncios",
                  ),
              
                  const Text(
                    "Escolha o tipo da sua conta",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  RadioGroup(
                    groupValue: controller.accountTypeEnum,
                    onChanged: (value) => controller.setAccountType(value!),
                    child:Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            value: AccountTypeEnum.FISICA,
                            title: Text(AccountTypeEnum.FISICA.description, 
                            style: TextStyle(fontSize: 12),),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            value: AccountTypeEnum.JURIDICA,
                            title: Text(AccountTypeEnum.JURIDICA.description,
                            style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
              
                  ReparaaiInputField(
                    controller: controller.documentController, 
                    title: controller.accountTypeEnum.document,
                  ),
            
                  ReparaaiInputField(
                    controller: controller.emailController, 
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confirmação',
                  ),
              
                  ReparaaiInputField(
                    controller: controller.passwordController,
                    obscureText: !controller.isPasswordVisible, 
                    title: 'Senha',
                    subtitle: 'Use letras, números e caracteres especiais',
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          controller.setIsPasswordVisible(!controller.isPasswordVisible);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            }
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003366),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.nextStep();
                    }
                  },
                  child: const Text(
                    "Continuar",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          
              // Já tem conta
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Já tem uma conta? "),
                  GestureDetector(
                    onTap: () {
                      // ação para entrar
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Color(0xFF003366),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
