// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on _SignupController, Store {
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

  @override
  String toString() {
    return '''
signup: ${signup}
    ''';
  }
}
