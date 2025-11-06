import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'motivation_page.dart';
import 'goal_page.dart';
import 'l10n/app_localizations.dart';
import 'services/language_service.dart';

class MainPage extends StatefulWidget {
  final Function(ThemeMode) onThemeChange;
  final LanguageService languageService;

  const MainPage({
    super.key,
    required this.onThemeChange,
    required this.languageService,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  File? _goalImage;
  String _goalTitle = '';
  String _goalDescription = '';

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _loadGoalData();
    _initializePages();
  }

  void _initializePages() {
    _pages = [
      MotivationPage(languageService: widget.languageService),
      GoalPage(
        goalImage: _goalImage,
        goalTitle: _goalTitle,
        goalDescription: _goalDescription,
        onGoalUpdate: _updateGoalData,
      ),
    ];
  }

  Future<void> _loadGoalData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _goalTitle = prefs.getString('goal_title') ?? '';
      _goalDescription = prefs.getString('goal_description') ?? '';
      final imagePath = prefs.getString('goal_image_path');
      if (imagePath != null && File(imagePath).existsSync()) {
        _goalImage = File(imagePath);
      }
    });
    _initializePages();
  }

  void _updateGoalData({
    File? image,
    String? title,
    String? description,
  }) {
    setState(() {
      if (image != null) _goalImage = image;
      if (title != null) _goalTitle = title;
      if (description != null) _goalDescription = description;
    });
    _initializePages();
  }

  String _getLanguageName(AppLocalizations l10n, SupportedLanguage language) {
    switch (language) {
      case SupportedLanguage.korean:
        return l10n.korean;
      case SupportedLanguage.english:
        return l10n.english;
      case SupportedLanguage.turkish:
        return l10n.turkish;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? l10n.dailyMotivation : l10n.myGoals,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          // 언어 선택 버튼
          PopupMenuButton<SupportedLanguage>(
            icon: const Icon(Icons.language),
            tooltip: l10n.language,
            onSelected: (language) {
              widget.languageService.changeLanguage(language);
            },
            itemBuilder: (context) => SupportedLanguage.values
                .map(
                  (language) => PopupMenuItem(
                    value: language,
                    child: Row(
                      children: [
                        Text(language.flag,
                            style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        Text(_getLanguageName(l10n, language)),
                        if (widget.languageService.currentLanguage == language)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.check, size: 16),
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          // 테마 선택 버튼
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.more_vert),
            onSelected: widget.onThemeChange,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    const Icon(Icons.brightness_auto),
                    const SizedBox(width: 8),
                    Text(l10n.systemMode),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    const Icon(Icons.light_mode),
                    const SizedBox(width: 8),
                    Text(l10n.lightMode),
                  ],
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode),
                    const SizedBox(width: 8),
                    Text(l10n.darkMode),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: AppLocalizations.of(context).quote,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: AppLocalizations.of(context).myGoals,
          ),
        ],
      ),
    );
  }
}
