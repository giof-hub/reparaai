import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libraries/libraries.dart';
import 'package:module_start/config/injection/injection_module_start.dart';
import 'package:module_start/config/routes_module_start.dart';
import 'package:core/core.dart';
import 'package:module_start/features/home/presentation/controllers/home_controller.dart';
import 'package:module_start/features/home/presentation/pages/home_page.dart';
import 'package:module_start/features/login/presentation/controllers/login_controller.dart';
import 'package:module_start/features/login/presentation/pages/login_page.dart';
import 'package:module_start/features/search/domain/entities/search_details_arguments.dart';
import 'package:module_start/features/search/presentation/controllers/search_controller.dart';
import 'package:module_start/features/search/presentation/controllers/search_detail_controller.dart';
import 'package:module_start/features/search/presentation/pages/search_details_page.dart';
import 'package:module_start/features/search/presentation/pages/search_page.dart';
import 'package:module_start/features/signup/domain/entities/signup_arguments.dart';
import 'package:module_start/features/signup/presentation/controllers/signup_controller.dart';
import 'package:module_start/features/signup/presentation/controllers/choose_document_want_send_controller.dart';
import 'package:module_start/features/signup/presentation/controllers/take_photo_with_open_document_controller.dart';
import 'package:module_start/features/signup/presentation/pages/choose_document_want_send_page.dart';
import 'package:module_start/features/signup/presentation/pages/signup_page.dart';
import 'package:module_start/features/signup/presentation/pages/take_photo_with_open_document_page.dart';
import 'package:module_start/internationalization/intl_app.dart';
import 'package:module_start/internationalization/intl_delegate.dart';

class ModuleStartResolver implements AppModule {
  static const String idModule = 'module_start';

  @override
  void Function() get createListener => () {
    debugPrint('');
  };

  @override
  void initializate() {
    IntlApp();
  }

  @override
  void Function() get injectDependencies => InjectionModuleStart().init;

  @override
  String get module => idModule;

  @override
  Map<String, widgetBuilderArgs> get routesNavigation => {
    "/": (context, args) => HomePage(controller: GetIt.I.get<HomeController>()),
    RoutesModuleStart.HOME.getPath(): (context, args) => HomePage(controller: GetIt.I.get<HomeController>()),
    RoutesModuleStart.SIGNUP.getPath(): (context, args) =>
        SignupPage(
          controller: GetIt.I.get<SignupController>(),
          args: args != null ? args as SignupArguments : null),
    RoutesModuleStart.CHOOSE_DOCUMENT_WANT_SEND.getPath(): (context, args) =>
        ChooseDocumentWantSendPage(
          controller: GetIt.I.get<ChooseDocumentWantSendController>(), 
          args: args != null ? args as SignupArguments : null),
    RoutesModuleStart.TAKE_PHOTO_WITH_OPEN_DOCUMENT.getPath(): (context, args) =>
        TakePhotoWithOpenDocumentPage(
          controller: GetIt.I.get<TakePhotoWithOpenDocumentController>(), 
          args: args != null ? args as SignupArguments : null),
    RoutesModuleStart.LOGIN.getPath(): (context, args) =>
        LoginPage(controller: GetIt.I.get<LoginController>()),
    RoutesModuleStart.SEARCH.getPath(): (context, args) =>
        SearchPage(controller: GetIt.I.get<SearchReparaiController>()),
    RoutesModuleStart.SEARCH_DETAILS.getPath(): (context, args) =>
        SearchDetailsPage(controller: GetIt.I.get<SearchDetailController>(), arguments: args as SearchDetailsArguments,),
  };

  @override
  List<Locale>? get supportLanguages => IntlDelegate.supportedLocales;
  
  @override
  LocalizationsDelegate? get internationalizationDelegate => IntlApp.delegate;
}
