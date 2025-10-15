import 'package:flutter/material.dart';
import 'package:libraries/libraries.dart';
import 'package:core/features/app/presentation/controllers/reparaai_page_controller.dart';
import '../../domain/entities/enums/document_type_enum.dart';
import '../../domain/entities/signup_arguments.dart';

part 'choose_document_want_send_controller.g.dart';

class ChooseDocumentWantSendController = _ChooseDocumentWantSendController
    with _$ChooseDocumentWantSendController;

abstract class _ChooseDocumentWantSendController extends ReparaaiPageController
    with Store {
  final formKey = GlobalKey<FormState>();

  @observable
  SignupArguments? args;

  @observable
  DocumentTypeEnum documentType = DocumentTypeEnum.RG;

  void nextStep() {
    args!.signup!.documentType = documentType.code;

    menuAction(
      path:
          "reparaai://module_flutter?route=reparaai/signup/take_photo_with_open_document",
      nome: "Take photo with open document",
      args: args,
    );
  }

  @action
  void setSignupArguments(SignupArguments args) {
    this.args = args;
  }

  @action
  void setDocumentType(DocumentTypeEnum documentType) {
    this.documentType = documentType;
  }
}
