// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class LibrariesLocalizations {
  LibrariesLocalizations();

  static LibrariesLocalizations? _current;

  static LibrariesLocalizations get current {
    assert(_current != null,
        'No instance of LibrariesLocalizations was loaded. Try to initialize the LibrariesLocalizations delegate before accessing LibrariesLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<LibrariesLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = LibrariesLocalizations();
      LibrariesLocalizations._current = instance;

      return instance;
    });
  }

  static LibrariesLocalizations of(BuildContext context) {
    final instance = LibrariesLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of LibrariesLocalizations present in the widget tree. Did you add LibrariesLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static LibrariesLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<LibrariesLocalizations>(
        context, LibrariesLocalizations);
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<LibrariesLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LibrariesLocalizations> load(Locale locale) =>
      LibrariesLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
