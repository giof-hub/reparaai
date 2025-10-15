import 'package:flutter/material.dart';
import 'package:libraries/libraries.dart';
import 'package:core/features/app/presentation/controllers/reparaai_page_controller.dart';
import '../../domain/entities/enums/document_type_enum.dart';
import '../../domain/entities/signup_entity.dart';

part 'take_photo_with_open_document_controller.g.dart';

class TakePhotoWithOpenDocumentController = _TakePhotoWithOpenDocumentController with _$TakePhotoWithOpenDocumentController;

abstract class _TakePhotoWithOpenDocumentController extends ReparaaiPageController with Store {

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
