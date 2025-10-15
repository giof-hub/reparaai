import 'package:flutter/widgets.dart';
import 'package:libraries/libraries.dart';
import 'package:core/features/app/presentation/controllers/reparaai_page_controller.dart';

part 'application_controller.g.dart';

class ApplicationController = _ApplicationControllerBase with _$ApplicationController;

abstract class _ApplicationControllerBase extends ReparaaiPageController with Store {

  AppLifecycleState? _state;

  List<String> paginasJornadaAtual = [];

  _ApplicationControllerBase();

  void setAppLifecycleState(AppLifecycleState state) {
    _state = state;
  }
}
