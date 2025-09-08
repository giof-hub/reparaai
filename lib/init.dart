import 'package:reparaai/app/module_runner.dart';
import 'package:reparaai/config/provider.dart';
import 'package:reparaai/config/resolver.dart';

void startReparaAiApp() => ModuleRunner.run(
  modules: [Resolver.instance],
  initArgs: Provider().argsInit
);
