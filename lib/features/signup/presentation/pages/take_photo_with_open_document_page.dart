import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:reparaai/core/domain/entities/enums/assets.dart';
import 'package:reparaai/core/extensions/string_extensions.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/core/presentation/widgets/reparaai_action_button.dart';
import 'package:reparaai/features/signup/domain/entities/signup_arguments.dart';
import 'package:reparaai/features/signup/presentation/controllers/take_photo_with_open_document_controller.dart';

class TakePhotoWithOpenDocumentPage extends StatefulWidget {
  static const String nameRoute = "take_photo_with_open_document";

  final TakePhotoWithOpenDocumentController controller;

  SignupArguments? args;

  TakePhotoWithOpenDocumentPage({super.key, required this.controller, this.args});

  @override
  _TakePhotoWithOpenDocumentPageState createState() => _TakePhotoWithOpenDocumentPageState(controller, false);
}

class _TakePhotoWithOpenDocumentPageState extends BasePageState<TakePhotoWithOpenDocumentPage, TakePhotoWithOpenDocumentController> {
  
  _TakePhotoWithOpenDocumentPageState(super.controller, super.hasAuthenticate);

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
                          "Tire uma fota com documento aberto",
                          style: TextStyle(fontSize: 20, color: Color(0xFF003366), fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: 20),
                      
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
                child: ReparaaiActionButton(
                  text: "Continuar",
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      
                    }
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
