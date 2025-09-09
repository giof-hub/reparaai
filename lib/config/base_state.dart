import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/controllers/reparaai_page_controller.dart';

abstract class BaseState<T extends StatefulWidget, C extends ReparaaiPageController> extends State<T> with RouteAware {
  C controller;

  BaseState(this.controller);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
