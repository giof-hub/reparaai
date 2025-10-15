// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_document_want_send_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChooseDocumentWantSendController
    on _ChooseDocumentWantSendController, Store {
  late final _$argsAtom = Atom(
    name: '_ChooseDocumentWantSendController.args',
    context: context,
  );

  @override
  SignupArguments? get args {
    _$argsAtom.reportRead();
    return super.args;
  }

  @override
  set args(SignupArguments? value) {
    _$argsAtom.reportWrite(value, super.args, () {
      super.args = value;
    });
  }

  late final _$documentTypeAtom = Atom(
    name: '_ChooseDocumentWantSendController.documentType',
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

  late final _$_ChooseDocumentWantSendControllerActionController =
      ActionController(
        name: '_ChooseDocumentWantSendController',
        context: context,
      );

  @override
  void setSignupArguments(SignupArguments args) {
    final _$actionInfo = _$_ChooseDocumentWantSendControllerActionController
        .startAction(
          name: '_ChooseDocumentWantSendController.setSignupArguments',
        );
    try {
      return super.setSignupArguments(args);
    } finally {
      _$_ChooseDocumentWantSendControllerActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDocumentType(DocumentTypeEnum documentType) {
    final _$actionInfo = _$_ChooseDocumentWantSendControllerActionController
        .startAction(name: '_ChooseDocumentWantSendController.setDocumentType');
    try {
      return super.setDocumentType(documentType);
    } finally {
      _$_ChooseDocumentWantSendControllerActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
args: ${args},
documentType: ${documentType}
    ''';
  }
}
