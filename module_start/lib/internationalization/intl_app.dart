import 'dart:io';

import 'package:flutter/material.dart';
import 'package:module_start/internationalization/generated/l10n.dart';
import 'package:module_start/internationalization/intl_delegate.dart';

class IntlApp {
  static late ModuleStartLocalizations _localization;

  IntlApp() {
    _init();
  }

  static ModuleStartLocalizations get current => _localization;

  static LocalizationsDelegate<ModuleStartLocalizations> get delegate => IntlDelegate();

  void _init() async {
    Locale locale = Locale("pt", "BR");
    String nomeLocal = Platform.localeName;
    Locale deviceLanguage = Locale(Platform.localeName);
    if (nomeLocal.contains("_")) {
      List<String> split = nomeLocal.split("_");
      deviceLanguage = Locale(split.first, split.elementAt(1));
    }
    IntlDelegate.supportedLocales.forEach((l) {
      if (l.languageCode == deviceLanguage.languageCode) {
        locale = l;
      }
    });
    ModuleStartLocalizations.load(locale).then((value) => _localization = value);
  }
}
