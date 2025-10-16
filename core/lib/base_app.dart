import 'package:core/core.dart';
import 'package:core/internationalization/intl_app.dart';
import 'package:core/internationalization/intl_delegate.dart';
import 'package:flutter/widgets.dart';

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

  void registerDependencyInject() {
    if (modules.isNotEmpty) {
      for (var module in modules) {
        module.injectDependencies();
      }
    }
  }

  void initIntl() {
    IntlApp();

    if (modules.isNotEmpty) {
      for (var module in modules) {
        module.initializate();
      }
    }
  }

  List<LocalizationsDelegate<dynamic>> internationalizationDelegate() {
    List<LocalizationsDelegate<dynamic>> list = [];

    list.add(IntlApp.delegate);
    if (modules.isNotEmpty) {
      modules.forEach((module) {
        if (module.internationalizationDelegate != null) {
          list.add(module.internationalizationDelegate!);
        }
      });
    }
    return list;
  }

  Set<Locale> supportLocaleModule() {
    Set<Locale> list = {};

    list.addAll(IntlDelegate.supportedLocales);
    if (modules.isNotEmpty) {
      for (var module in modules) {
        if (module.supportLanguages != null) {
          list.addAll(module.supportLanguages!);
        }
      }
    }
    return list;
  }

  Route<dynamic>? routeGenerator(RouteSettings config, {dynamic initArgs}) {
    var routeName = config.name;
    dynamic routeArgs;

    // var route = routes.getValueOrDefault(key: routeName, def: "");

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
