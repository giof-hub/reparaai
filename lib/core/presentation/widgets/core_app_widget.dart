import 'package:flutter/material.dart';
import 'package:reparaai/app/base_app.dart';
import 'package:reparaai/config/config_help.dart';
import 'package:reparaai/core/data/models/app_module.dart';

class CoreAppWidget extends StatefulWidget {
  final String initialRoute;
  final dynamic initArgs;
  final TransitionBuilder? builder;
  final List<AppModule>? externalModules;
  final Widget? widget;

  const CoreAppWidget({
    super.key,
    this.initialRoute = '/',
    this.initArgs,
    this.externalModules,
    this.builder,
    this.widget,
  });

  @override
  CoreAppWidgetState createState() => CoreAppWidgetState();
}

class CoreAppWidgetState extends State<CoreAppWidget> with BaseApp {
  @override
  void initState() {
    super.initState();
    _startRoutesConfiguration();
  }

  void _startRoutesConfiguration() {
    super.registerRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ConfigHelp.navegador,
      restorationScopeId: "app",
      debugShowCheckedModeBanner: false,
      title: "ReparaAi",
      home: widget.widget,
      onGenerateRoute: (settings) =>
          super.routeGenerator(settings, initArgs: widget.initArgs),
      initialRoute: widget.initialRoute,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 32, 95, 168),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Map<String, widgetBuilderArgs> get baseRoutes => {};

  @override
  List<AppModule> get modules => widget.externalModules ?? [];
}
