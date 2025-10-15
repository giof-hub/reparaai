import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

void main() async {
  await runZonedGuarded(() async {
      await createInitialConfig();

      runApp(
        CoreAppWidget(),
      );
    }, (error, stackTrace) {});
}

Future<void> createInitialConfig() async {
  // final inject = injection ?? Injection();

  // inject.init();

  WidgetsFlutterBinding.ensureInitialized();
}