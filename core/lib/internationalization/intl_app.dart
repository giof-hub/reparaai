import 'dart:io';

import 'package:core/internationalization/generated/l10n.dart';
import 'package:core/internationalization/intl_delegate.dart';
import 'package:flutter/material.dart';

class IntlApp {
  static late CoreLocalizations _localization;

  IntlApp() {
    _init();
  }

  static CoreLocalizations get current => _localization;

  static LocalizationsDelegate<CoreLocalizations> get delegate => IntlDelegate();

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
    CoreLocalizations.load(locale).then((value) => _localization = value);
  }
}
