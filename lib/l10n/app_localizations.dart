import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_tr.dart';

abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('ko', 'KR'),
    Locale('en', 'US'),
    Locale('tr', 'TR')
  ];

  // 앱 제목과 기본 텍스트
  String get appTitle;
  String get appSubtitle;
  String get dailyMotivation;
  String get myGoals;
  String get settings;
  String get favorites;
  String get addGoal;
  String get editGoal;
  String get deleteGoal;
  String get goalTitle;
  String get goalDescription;
  String get save;
  String get cancel;
  String get delete;
  String get confirm;

  // 테마 관련
  String get theme;
  String get lightMode;
  String get darkMode;
  String get systemMode;

  // 언어 관련
  String get language;
  String get korean;
  String get english;
  String get turkish;

  // 명언 관련
  String get quote;
  String get author;
  String get category;
  String get success;
  String get motivation;
  String get life;
  String get dreams;
  String get challenge;
  String get growth;

  // 기타
  String get share;
  String get copy;
  String get copied;
  String get error;
  String get retry;
  String get noQuotesAvailable;
  String get loadingQuotes;
  String get newQuoteIn10Seconds;

  // 목표 관련
  String get addImage;
  String get goalImage;
  String get goalSaved;
  String get cannotSelectImage;
  String get goalDescriptionHint;
  String get editGoalButton;
  String get newQuote;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue on GitHub with a '
      'reproducible sample app and the gen-l10n configuration that was used.');
}
