import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reparaai/core/domain/entities/enums/assets.dart';
import 'package:reparaai/core/extensions/string_extensions.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/features/signup/domain/entities/enums/document_type_enum.dart';
import 'package:reparaai/features/signup/domain/entities/signup_arguments.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_doc_controller.dart';
import 'package:reparaai/features/signup/presentation/widgets/radio_signup_option_widget.dart';

class SignupDocPage extends StatefulWidget {
  static const String nameRoute = "signup_doc";

  final SignupDocController controller;

  SignupArguments? args;

  SignupDocPage({super.key, required this.controller, this.args});

  @override
  _SignupDocPageState createState() => _SignupDocPageState(controller, false);
}

class _SignupDocPageState extends BasePageState<SignupDocPage, SignupDocController> {
  
  _SignupDocPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    controller.setSignUp(widget.args!.signup!);
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
        child: Column(
          children: [            
            Form(
              key: controller.formKey,
              child: Observer(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.svgs.icIdCard.toSvg(),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: const Text(
                          "Neste momento iremos solicitar uma foto da sua documentação para validação de sua identidade",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                  
                      const Text(
                        "Escolha o documento que deseja enviar",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RadioGroup(
                        groupValue: controller.documentType,
                        onChanged: (value) => controller.setDocumentType(value!),
                        child: Column(
                          children: [
                            RadioSignupOptionWidget(
                              imagePath: DocumentTypeEnum.RG.path,
                              description: DocumentTypeEnum.RG.description, 
                              value: DocumentTypeEnum.RG,
                              isSelected: controller.documentType == DocumentTypeEnum.RG,
                            ),
                            SizedBox(height: 18),
                            RadioSignupOptionWidget(
                              imagePath: DocumentTypeEnum.CNH.path,
                              description: DocumentTypeEnum.CNH.description, 
                              value: DocumentTypeEnum.CNH,
                              isSelected: controller.documentType == DocumentTypeEnum.CNH,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      
                    }
                  },
                  child: const Text(
                    "Continuar",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
