import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

enum SupportedLanguage {
  korean('ko', 'KR', '한국어', '🇰🇷'),
  english('en', 'US', 'English', '🇺🇸'),
  turkish('tr', 'TR', 'Türkçe', '🇹🇷');

  const SupportedLanguage(
      this.languageCode, this.countryCode, this.displayName, this.flag);

  final String languageCode;
  final String countryCode;
  final String displayName;
  final String flag;

  Locale get locale => Locale(languageCode, countryCode);
}

class LanguageService extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  SupportedLanguage _currentLanguage = SupportedLanguage.korean;

  SupportedLanguage get currentLanguage => _currentLanguage;
  Locale get currentLocale => _currentLanguage.locale;

  /// 시스템 언어를 감지하여 지원되는 언어 반환
  SupportedLanguage _detectSystemLanguage() {
    final systemLocale = ui.PlatformDispatcher.instance.locale;
    final systemLanguageCode = systemLocale.languageCode;
    
    // 시스템 언어가 지원되는 언어인지 확인
    try {
      return SupportedLanguage.values.firstWhere(
        (lang) => lang.languageCode == systemLanguageCode,
      );
    } catch (e) {
      // 지원되지 않는 언어인 경우 영어를 기본값으로 설정
      return SupportedLanguage.english;
    }
  }

  /// 언어 설정 초기화
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = prefs.getString(_languageKey);

    if (savedLanguageCode != null) {
      try {
        _currentLanguage = SupportedLanguage.values.firstWhere(
          (lang) => lang.languageCode == savedLanguageCode,
        );
      } catch (e) {
        // 저장된 언어가 유효하지 않으면 시스템 언어 감지
        _currentLanguage = _detectSystemLanguage();
      }
    } else {
      // 저장된 언어가 없으면 시스템 언어로 자동 설정
      _currentLanguage = _detectSystemLanguage();
      // 감지된 언어를 저장
      await prefs.setString(_languageKey, _currentLanguage.languageCode);
    }
    notifyListeners();
  }

  /// 시스템 언어가 자동으로 설정되었는지 확인
  bool isSystemLanguageDetected() {
    final systemLanguage = _detectSystemLanguage();
    return _currentLanguage == systemLanguage;
  }

  /// 현재 지원되는 시스템 언어 반환
  SupportedLanguage get systemLanguage => _detectSystemLanguage();

  /// 언어 변경
  Future<void> changeLanguage(SupportedLanguage language) async {
    if (_currentLanguage == language) return;

    _currentLanguage = language;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language.languageCode);

    notifyListeners();
  }

  /// 지원하는 모든 언어 목록 반환
  static List<SupportedLanguage> get supportedLanguages =>
      SupportedLanguage.values;

  /// 지원하는 모든 로케일 목록 반환
  static List<Locale> get supportedLocales =>
      SupportedLanguage.values.map((lang) => lang.locale).toList();
}
