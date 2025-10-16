import 'package:libraries/libraries.dart';
import 'package:flutter/material.dart';
import 'package:module_start/internationalization/generated/l10n.dart';

class IntlDelegate extends LocalizationsDelegate<ModuleStartLocalizations> {
  static List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) {
    return _isSupported(locale);
  }

  @override
  Future<ModuleStartLocalizations> load(Locale locale) {
    String l = locale.toString();
    Intl.defaultLocale = l;
    Intl.systemLocale = l;
    Intl.canonicalizedLocale(l);
    return ModuleStartLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<ModuleStartLocalizations> old) {
    return true;
  }

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
