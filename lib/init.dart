import 'package:reparaai/app/module_runner.dart';
import 'package:reparaai/config/provider.dart';

void startReparaAiApp() => ModuleRunner.run(initArgs: Provider().argsInit);
