import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reparaai/config/injection/injection.dart';
import 'package:reparaai/config/routes.dart';
import 'package:reparaai/core/data/models/app_module.dart';
import 'package:reparaai/features/home/presentation/controllers/home_controller.dart';
import 'package:reparaai/features/home/presentation/pages/home_page.dart';
import 'package:reparaai/features/login/presentation/controllers/login_controller.dart';
import 'package:reparaai/features/login/presentation/pages/login_page.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_controller.dart';
import 'package:reparaai/features/signup/presentation/controllers/signup_doc_controller.dart';
import 'package:reparaai/features/signup/presentation/pages/signup_doc_page.dart';
import 'package:reparaai/features/signup/presentation/pages/signup_page.dart';

class Resolver implements AppModule {
  static const String idModule = 'reparaai';

  static final Resolver instance = Resolver._();

  Resolver._() {
    injectDependencies();
  }

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
    Routes.HOME.getPath(): (context, args) => HomePage(controller: GetIt.I.get<HomeController>()),
    Routes.SIGNUP.getPath(): (context, args) =>
        SignupPage(controller: GetIt.I.get<SignupController>()),
    Routes.SIGNUP_DOC.getPath(): (context, args) =>
        SignupDocPage(controller: GetIt.I.get<SignupDocController>()),
    Routes.LOGIN.getPath(): (context, args) =>
        LoginPage(controller: GetIt.I.get<LoginController>()),
  };

  @override
  List<Locale>? get supportLanguages => throw UnimplementedError();
}
