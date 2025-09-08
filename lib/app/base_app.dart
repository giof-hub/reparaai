import 'package:flutter/widgets.dart';
import 'package:reparaai/core/data/models/app_module.dart';
import 'package:reparaai/core/extensions/map_extensions.dart';

abstract mixin class BaseApp {
  List<AppModule> get modules;

  Map<String, widgetBuilderArgs> get baseRoutes;

  final Map<String, widgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) {
      routes.addAll(baseRoutes);
    }

    if (modules.isNotEmpty) {
      for (var module in modules) {
        routes.addAll(module.routesNavigation);
      }
    }
  }

  Route<dynamic>? routeGenerator(RouteSettings config, {dynamic initArgs}) {
    var routeName = config.name;
    dynamic routeArgs;

    Map<String, String> map = {"teste": "testeeeee"};

    print(map["teste"]);

    var route = routes.getValueOrDefault(key: routeName, def: "");

    var navigateTo = routes[routeName];
    if (navigateTo == null) return null;

    if (routeName == '/' && initArgs != null) {
      routeArgs = initArgs;
    } else {
      routeArgs = config.arguments;
    }

    return PageRouteBuilder(
      settings: config,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) =>
          navigateTo.call(context, routeArgs),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuart;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
