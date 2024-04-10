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

class Str {
  Str();

  static Str? _current;

  static Str get current {
    assert(_current != null,
        'No instance of Str was loaded. Try to initialize the Str delegate before accessing Str.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Str> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Str();
      Str._current = instance;

      return instance;
    });
  }

  static Str of(BuildContext context) {
    final instance = Str.maybeOf(context);
    assert(instance != null,
        'No instance of Str present in the widget tree. Did you add Str.delegate in localizationsDelegates?');
    return instance!;
  }

  static Str? maybeOf(BuildContext context) {
    return Localizations.of<Str>(context, Str);
  }

  /// `Invalid Response`
  String get invalidResponse {
    return Intl.message(
      'Invalid Response',
      name: 'invalidResponse',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection.`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection.',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `No data found!`
  String get noDataFound {
    return Intl.message(
      'No data found!',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Oops Something went wrong`
  String get oopsSomethingWentWrong {
    return Intl.message(
      'Oops Something went wrong',
      name: 'oopsSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Oops, No results found!`
  String get oopsNoResultsFound {
    return Intl.message(
      'Oops, No results found!',
      name: 'oopsNoResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong! Please try after some time.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong! Please try after some time.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Country Data`
  String get countryData {
    return Intl.message(
      'Country Data',
      name: 'countryData',
      desc: '',
      args: [],
    );
  }

  /// `{delete} is been deleted`
  String deleteCountry(Object delete) {
    return Intl.message(
      '$delete is been deleted',
      name: 'deleteCountry',
      desc: '',
      args: [delete],
    );
  }

  /// `Country flag view`
  String get flag {
    return Intl.message(
      'Country flag view',
      name: 'flag',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Str> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Str> load(Locale locale) => Str.load(locale);
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
