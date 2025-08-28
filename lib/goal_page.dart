import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class GoalPage extends StatefulWidget {
  final File? goalImage;
  final String goalTitle;
  final String goalDescription;
  final Function({File? image, String? title, String? description}) onGoalUpdate;

  const GoalPage({
    super.key,
    this.goalImage,
    required this.goalTitle,
    required this.goalDescription,
    required this.onGoalUpdate,
  });

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.goalTitle);
    _descriptionController = TextEditingController(text: widget.goalDescription);
    _selectedImage = widget.goalImage;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('이미지를 선택할 수 없습니다: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _saveGoal() async {
    final prefs = await SharedPreferences.getInstance();
    
    // 제목과 설명 저장
    await prefs.setString('goal_title', _titleController.text);
    await prefs.setString('goal_description', _descriptionController.text);
    
    // 이미지 경로 저장
    if (_selectedImage != null) {
      await prefs.setString('goal_image_path', _selectedImage!.path);
    }

    // 부모 위젯에 업데이트 알림
    widget.onGoalUpdate(
      image: _selectedImage,
      title: _titleController.text,
      description: _descriptionController.text,
    );

    setState(() {
      _isEditing = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('목표가 저장되었습니다'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 목표 이미지 섹션
                Center(
                  child: GestureDetector(
                    onTap: _isEditing ? _pickImage : null,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: _selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _isEditing ? Icons.add_photo_alternate : Icons.flag,
                                  size: 64,
                                  color: colorScheme.primary.withOpacity(0.6),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  _isEditing ? '이미지 추가' : '목표 이미지',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurface.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // 목표 제목 섹션
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.title,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '목표 제목',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _isEditing
                          ? TextField(
                              controller: _titleController,
                              decoration: InputDecoration(
                                hintText: '나의 목표를 입력하세요',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                              ),
                              style: theme.textTheme.titleLarge,
                              maxLength: 50,
                            )
                          : Text(
                              _titleController.text.isEmpty ? '목표 제목을 설정하세요' : _titleController.text,
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: _titleController.text.isEmpty 
                                    ? colorScheme.onSurface.withOpacity(0.5)
                                    : colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // 목표 설명 섹션
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.description,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '목표 설명',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _isEditing
                          ? TextField(
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                hintText: '목표에 대한 자세한 설명을 작성하세요',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                              ),
                              maxLines: 5,
                              maxLength: 500,
                            )
                          : Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(minHeight: 80),
                              child: Text(
                                _descriptionController.text.isEmpty 
                                    ? '목표에 대한 설명을 추가하세요' 
                                    : _descriptionController.text,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: _descriptionController.text.isEmpty 
                                      ? colorScheme.onSurface.withOpacity(0.5)
                                      : colorScheme.onSurface,
                                  height: 1.6,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                
                // 액션 버튼들
                Row(
                  children: [
                    if (_isEditing) ...[
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _isEditing = false;
                              _titleController.text = widget.goalTitle;
                              _descriptionController.text = widget.goalDescription;
                              _selectedImage = widget.goalImage;
                            });
                          },
                          child: const Text('취소'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _saveGoal,
                          child: const Text('저장'),
                        ),
                      ),
                    ] else
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _isEditing = true;
                            });
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('목표 수정'),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
