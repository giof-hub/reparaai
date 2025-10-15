// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupController, Store {
  late final _$accountTypeEnumAtom = Atom(
    name: '_SignupController.accountTypeEnum',
    context: context,
  );

  @override
  AccountTypeEnum get accountTypeEnum {
    _$accountTypeEnumAtom.reportRead();
    return super.accountTypeEnum;
  }

  @override
  set accountTypeEnum(AccountTypeEnum value) {
    _$accountTypeEnumAtom.reportWrite(value, super.accountTypeEnum, () {
      super.accountTypeEnum = value;
    });
  }

  late final _$isPasswordVisibleAtom = Atom(
    name: '_SignupController.isPasswordVisible',
    context: context,
  );

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  late final _$signupAtom = Atom(
    name: '_SignupController.signup',
    context: context,
  );

  @override
  SignupEntity get signup {
    _$signupAtom.reportRead();
    return super.signup;
  }

  @override
  set signup(SignupEntity value) {
    _$signupAtom.reportWrite(value, super.signup, () {
      super.signup = value;
    });
  }

  late final _$_SignupControllerActionController = ActionController(
    name: '_SignupController',
    context: context,
  );

  @override
  void setIsPasswordVisible(bool isPasswordVisible) {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
      name: '_SignupController.setIsPasswordVisible',
    );
    try {
      return super.setIsPasswordVisible(isPasswordVisible);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountType(AccountTypeEnum accountTypeEnum) {
    final _$actionInfo = _$_SignupControllerActionController.startAction(
      name: '_SignupController.setAccountType',
    );
    try {
      return super.setAccountType(accountTypeEnum);
    } finally {
      _$_SignupControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountTypeEnum: ${accountTypeEnum},
isPasswordVisible: ${isPasswordVisible},
signup: ${signup}
    ''';
  }
}
