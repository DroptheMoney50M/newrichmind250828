import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_page.dart';
import 'l10n/app_localizations.dart';
import 'services/language_service.dart';

void main() {
  runApp(const MotivationApp());
}

class MotivationApp extends StatefulWidget {
  const MotivationApp({super.key});

  @override
  State<MotivationApp> createState() => _MotivationAppState();
}

class _MotivationAppState extends State<MotivationApp> {
  ThemeMode _themeMode = ThemeMode.system;
  final LanguageService _languageService = LanguageService();

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
    _initializeLanguage();
  }

  Future<void> _initializeLanguage() async {
    await _languageService.initialize();
    _languageService.addListener(() {
      setState(() {});
    });
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('theme_mode') ?? 0;
    setState(() {
      _themeMode = ThemeMode.values[themeIndex];
    });
  }

  Future<void> _saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', mode.index);
  }

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
    _saveThemeMode(mode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotivateMe - 동기부여 명언',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      locale: _languageService.currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'NotoSansKR',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'NotoSansKR',
      ),
      home: MainPage(
        onThemeChange: _changeTheme,
        languageService: _languageService,
      ),
    );
  }
}
