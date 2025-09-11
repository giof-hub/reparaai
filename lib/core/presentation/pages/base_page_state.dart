import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:reparaai/config/base_state.dart';
import 'package:reparaai/core/domain/usecases/auth_usecase.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';

abstract class BasePageState<
  T extends StatefulWidget,
  C extends ReparaaiPageController
>
    extends BaseState<T, C> {
  bool hasAuthenticate;

  BasePageState(super.controller, this.hasAuthenticate);

  @override
  void initState() {
    if (hasAuthenticate) {
      AuthUsecase authUsecase = GetIt.I.get<AuthUsecase>();

      var isAuthenticated = await authUsecase.isAuthenticated();

      if (!isAuthenticated) {

      }
    }


    super.initState();
  }
}
