import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'database/quote_database.dart';

class MotivationPage extends StatefulWidget {
  const MotivationPage({super.key});

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  Quote _currentQuote = QuoteDatabase.getRandomQuote();
  int _quotesViewed = 0;
  Timer? _autoSwitchTimer;
  bool _autoSwitch = true;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _loadQuotesViewed();
    _startAutoSwitch();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  void _startAutoSwitch() {
    if (_autoSwitch) {
      _autoSwitchTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
        _nextQuote();
      });
    }
  }

  void _stopAutoSwitch() {
    _autoSwitchTimer?.cancel();
  }

  Future<void> _loadQuotesViewed() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _quotesViewed = prefs.getInt('quotes_viewed') ?? 0;
    });
  }

  Future<void> _saveQuotesViewed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quotes_viewed', _quotesViewed);
  }

  void _nextQuote() {
    _animationController.reverse().then((_) {
      setState(() {
        _currentQuote = QuoteDatabase.getRandomQuote();
        _quotesViewed++;
      });
      _saveQuotesViewed();
      _animationController.forward();
    });
  }

  void _toggleAutoSwitch() {
    setState(() {
      _autoSwitch = !_autoSwitch;
    });
    
    if (_autoSwitch) {
      _startAutoSwitch();
    } else {
      _stopAutoSwitch();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _autoSwitchTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 상단 정보 바
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '본 명언: $_quotesViewed개',
                        style: TextStyle(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _toggleAutoSwitch,
                          icon: Icon(
                            _autoSwitch ? Icons.pause : Icons.play_arrow,
                            color: colorScheme.primary,
                          ),
                          tooltip: _autoSwitch ? '자동 전환 중지' : '자동 전환 시작',
                        ),
                        IconButton(
                          onPressed: _nextQuote,
                          icon: Icon(
                            Icons.refresh,
                            color: colorScheme.primary,
                          ),
                          tooltip: '새로운 명언',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // 명언 카드
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: colorScheme.shadow.withOpacity(0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.format_quote,
                                  size: 48,
                                  color: colorScheme.primary.withOpacity(0.3),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  _currentQuote.text,
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: colorScheme.onSurface,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primaryContainer.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '- ${_currentQuote.author} -',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.onPrimaryContainer,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              // 하단 진행 표시
              if (_autoSwitch)
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer,
                        size: 16,
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '10초 후 새로운 명언',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _nextQuote,
        label: const Text('새 명언'),
        icon: const Icon(Icons.auto_awesome),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),
    );
  }
}
