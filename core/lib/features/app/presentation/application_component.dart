import 'package:core/base_state.dart';
import 'package:core/features/app/presentation/controllers/application_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ApplicationComponent extends StatefulWidget {
  static const nomeRota = "aplication";

  final ApplicationController controller;
  final Widget child;

  ApplicationComponent({required this.controller, required this.child});

  @override
  _ApplicationComponentState createState() => _ApplicationComponentState(controller);
}

class _ApplicationComponentState extends BaseState<ApplicationComponent, ApplicationController>
    with WidgetsBindingObserver {
  _ApplicationComponentState(super.controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    controller.setAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        print('App em primeiro plano (foreground)');
        break;
      case AppLifecycleState.inactive:
        print('App inativo');
        break;
      case AppLifecycleState.paused:
        print('App em segundo plano (background)');
        break;
      case AppLifecycleState.detached:
        print('App está sendo descartado');
        break;
      case AppLifecycleState.hidden:
        print('App está escondido');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationInherited(child: widget.child, state: this);
  }
}

class ApplicationInherited extends InheritedWidget {
  final _ApplicationComponentState state;

  ApplicationInherited({required Widget child, required this.state}) : super(child: child);

  static _ApplicationComponentState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ApplicationInherited>(aspect: ApplicationInherited)?.state;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this != oldWidget;
  }
}
