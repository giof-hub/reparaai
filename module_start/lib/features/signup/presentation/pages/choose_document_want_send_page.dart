import 'package:flutter/material.dart';
import 'package:libraries/libraries.dart';
import 'package:core/extensions/string_extensions.dart';
import 'package:core/features/app/presentation/pages/base_page_state.dart';
import 'package:module_design_system/gen/assets.dart';
import 'package:module_design_system/presentation/widget/reparaai_action_button.dart';
import '../../domain/entities/enums/document_type_enum.dart';
import '../../domain/entities/signup_arguments.dart';
import '../controllers/choose_document_want_send_controller.dart';
import '../widgets/radio_signup_option_widget.dart';

class ChooseDocumentWantSendPage extends StatefulWidget {
  static const String nameRoute = "choose_document_want_send";

  final ChooseDocumentWantSendController controller;

  SignupArguments? args;

  ChooseDocumentWantSendPage({super.key, required this.controller, this.args});

  @override
  _ChooseDocumentWantSendPageState createState() =>
      _ChooseDocumentWantSendPageState(controller, false);
}

class _ChooseDocumentWantSendPageState 
  extends BasePageState<ChooseDocumentWantSendPage, ChooseDocumentWantSendController> {
  _ChooseDocumentWantSendPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    controller.setSignupArguments(widget.args!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text("Documentos"),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.svgs.icIdCard.toSvg(),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: const Text(
                          "Neste momento iremos solicitar uma foto da sua documentação para validação de sua identidade",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF003366),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 110),

                      const Text(
                        "Escolha o documento que deseja enviar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003366),
                        ),
                      ),

                      SizedBox(height: 20),
                      RadioGroup(
                        groupValue: controller.documentType,
                        onChanged: (value) =>
                            controller.setDocumentType(value!),
                        child: Column(
                          children: [
                            RadioSignupOptionWidget(
                              imagePath: DocumentTypeEnum.RG.path,
                              description: DocumentTypeEnum.RG.description,
                              value: DocumentTypeEnum.RG,
                              isSelected:
                                  controller.documentType ==
                                  DocumentTypeEnum.RG,
                            ),
                            SizedBox(height: 18),
                            RadioSignupOptionWidget(
                              imagePath: DocumentTypeEnum.CNH.path,
                              description: DocumentTypeEnum.CNH.description,
                              value: DocumentTypeEnum.CNH,
                              isSelected:
                                  controller.documentType ==
                                  DocumentTypeEnum.CNH,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
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
                child: ReparaaiActionButton(
                  text: "Continuar",
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.nextStep();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
