import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reparaai/config/injection/injection.dart';
import 'package:reparaai/config/routes.dart';
import 'package:reparaai/core/data/models/app_module.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';
import 'package:reparaai/features/signup/presentation/pages/signup_page.dart';

class Resolver implements AppModule {
  static const String idModule = 'reparaai';

  @override
  void Function() get createListener => () {
    debugPrint('');
  };

  @override
  void initializate() {}

  @override
  void Function() get injectDependencies => Injection().init;

  @override
  String get module => idModule;

  @override
  Map<String, widgetBuilderArgs> get routesNavigation => {
    Routes.SIGNUP.getPath(): (context, args) =>
        SignupPage(controller: GetIt.I.get<SignupController>()),
  };

  @override
  List<Locale>? get supportLanguages => throw UnimplementedError();
}
