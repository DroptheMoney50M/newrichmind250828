import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'motivation_page.dart';
import 'goal_page.dart';

class MainPage extends StatefulWidget {
  final Function(ThemeMode) onThemeChange;

  const MainPage({super.key, required this.onThemeChange});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  File? _goalImage;
  String _goalTitle = '나의 목표';
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
      MotivationPage(),
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
      _goalTitle = prefs.getString('goal_title') ?? '나의 목표';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? '동기부여 명언' : '나의 목표',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.more_vert),
            onSelected: widget.onThemeChange,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    Icon(Icons.brightness_auto),
                    SizedBox(width: 8),
                    Text('시스템 테마'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    Icon(Icons.light_mode),
                    SizedBox(width: 8),
                    Text('라이트 모드'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    Icon(Icons.dark_mode),
                    SizedBox(width: 8),
                    Text('다크 모드'),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: '명언',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: '목표',
          ),
        ],
      ),
    );
  }
}
