import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
typedef widgetBuilderArgs = Widget Function(BuildContext context, Object? args);

abstract class AppModule {

  String get module;

  Map<String, widgetBuilderArgs> get routesNavigation;

  void Function() get injectDependencies;

  void Function() get createListener;

  List<Locale>? get supportLanguages;

  void initializate();
}