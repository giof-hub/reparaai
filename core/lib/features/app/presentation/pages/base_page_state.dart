import 'package:core/base_state.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:libraries/libraries.dart';

abstract class BasePageState<
  T extends StatefulWidget,
  C extends ReparaaiPageController
>
    extends BaseState<T, C> {
  bool hasAuthenticate;

  BasePageState(super.controller, this.hasAuthenticate);

  @override
  void initState() {
    super.initState();

    validateNeedGuardianAct();
  }

  void validateNeedGuardianAct() async {
    if (hasAuthenticate) {
      AuthUsecase authUsecase = GetIt.I.get<AuthUsecase>();

      var isAuthenticated = await authUsecase.isAuthenticated();

      if (!isAuthenticated) {
        controller.menuAction(
          path: "reparaai://module_flutter?route=reparaai/login/login",
          nome: 'Login',
        );
      }
    }
  }
}
