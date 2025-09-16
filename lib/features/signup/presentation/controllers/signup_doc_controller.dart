import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/signup/domain/entities/enums/document_type_enum.dart';
import 'package:reparaai/features/signup/domain/entities/signup_entity.dart';

part 'signup_doc_controller.g.dart';

class SignupDocController = _SignupDocController with _$SignupDocController;

abstract class _SignupDocController extends ReparaaiPageController with Store {

  final formKey = GlobalKey<FormState>();

  @observable
  SignupEntity? signup;

  @observable
  DocumentTypeEnum documentType = DocumentTypeEnum.RG;

  @action
  void setSignUp(SignupEntity signup) {
    this.signup = signup;
  }

  @action
  void setDocumentType(DocumentTypeEnum documentType) {
    this.documentType = documentType;
  }
}
