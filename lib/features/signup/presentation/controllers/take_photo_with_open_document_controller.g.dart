// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_photo_with_open_document_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TakePhotoWithOpenDocumentController
    on _TakePhotoWithOpenDocumentController, Store {
  late final _$signupAtom = Atom(
    name: '_TakePhotoWithOpenDocumentController.signup',
    context: context,
  );

  @override
  SignupEntity? get signup {
    _$signupAtom.reportRead();
    return super.signup;
  }

  @override
  set signup(SignupEntity? value) {
    _$signupAtom.reportWrite(value, super.signup, () {
      super.signup = value;
    });
  }

  late final _$documentTypeAtom = Atom(
    name: '_TakePhotoWithOpenDocumentController.documentType',
    context: context,
  );

  @override
  DocumentTypeEnum get documentType {
    _$documentTypeAtom.reportRead();
    return super.documentType;
  }

  @override
  set documentType(DocumentTypeEnum value) {
    _$documentTypeAtom.reportWrite(value, super.documentType, () {
      super.documentType = value;
    });
  }

  late final _$_TakePhotoWithOpenDocumentControllerActionController =
      ActionController(
        name: '_TakePhotoWithOpenDocumentController',
        context: context,
      );

  @override
  void setSignUp(SignupEntity signup) {
    final _$actionInfo = _$_TakePhotoWithOpenDocumentControllerActionController
        .startAction(name: '_TakePhotoWithOpenDocumentController.setSignUp');
    try {
      return super.setSignUp(signup);
    } finally {
      _$_TakePhotoWithOpenDocumentControllerActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDocumentType(DocumentTypeEnum documentType) {
    final _$actionInfo = _$_TakePhotoWithOpenDocumentControllerActionController
        .startAction(
          name: '_TakePhotoWithOpenDocumentController.setDocumentType',
        );
    try {
      return super.setDocumentType(documentType);
    } finally {
      _$_TakePhotoWithOpenDocumentControllerActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
signup: ${signup},
documentType: ${documentType}
    ''';
  }
}
