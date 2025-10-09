import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';
import 'package:reparaai/features/signup/domain/entities/enums/account_type_enum.dart';
import 'package:reparaai/features/signup/domain/entities/signup_arguments.dart';
import 'package:reparaai/features/signup/domain/entities/signup_entity.dart';
import 'package:reparaai/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController extends ReparaaiPageController with Store {
  final SignupUsecase _useCase;

  final formKey = GlobalKey<FormState>();

  // Controllers dos campos
  final TextEditingController nameController = TextEditingController();
  final TextEditingController documentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @observable
  AccountTypeEnum accountTypeEnum = AccountTypeEnum.FISICA;

  @observable
  bool isPasswordVisible = false;

  @observable
  SignupEntity signup = SignupEntity.empty();

  SignupArguments? args;

  _SignupController(this._useCase);

  void init() {
    args ??= SignupArguments();
  }

  void nextStep() {

    signup.fullName = nameController.text;
    signup.document = documentController.text;
    signup.email = emailController.text;
    signup.password = passwordController.text;
    signup.accountType = accountTypeEnum.code;

    args!.signup = signup;

    menuAction(
      path: "reparaai://module_flutter?route=reparaai/signup/choose_document_want_send", 
      nome: "Sign Up", args: args
    );
  }

  @action
  void setIsPasswordVisible(bool isPasswordVisible) {
    this.isPasswordVisible = isPasswordVisible;
  }

  @action
  void setAccountType(AccountTypeEnum accountTypeEnum) {
    this.accountTypeEnum = accountTypeEnum;
  }
}
