import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reparaai/config/injection/injection.dart';
import 'package:reparaai/core/data/models/app_module.dart';
import 'package:reparaai/core/presentation/widgets/core_app_widget.dart';

class ModuleRunner {
  static Future<void> run({
    List<AppModule>? modules,
    Injection? inject,
    ThemeData? theme,
    ThemeData? themeDark,
    String initialRoute = '/',
    dynamic initArgs
  }) async {
    await runZonedGuarded(() async {

      await _createInitialConfig(injection: inject);

      runApp(
        CoreAppWidget(
          externalModules: modules,
          initialRoute: initialRoute,
          initArgs: initArgs,
        )
      );
    }, 
    (error, stackTrace) {

    });
  }

  static Future<void> _createInitialConfig({Injection? injection}) async {
    final inject = injection ?? Injection();

    inject.init();

    WidgetsFlutterBinding.ensureInitialized();
  }
}