import 'package:flutter/material.dart';
import 'package:reparaai/config/base_state.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';

abstract class BasePageState<T extends StatefulWidget, C extends ReparaaiPageController> extends BaseState<T, C> {
  BasePageState(C controller) : super(controller);

  @override
  void initState() {
    super.initState();
  }


}