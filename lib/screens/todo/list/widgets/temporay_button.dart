import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_theme.dart';

class TemporayButton extends StatelessWidget {
  /// 임시 저장 버튼
  const TemporayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text('임시저장', style: TextStyle(color: AppTheme.charcoal)),
    );
  }
}
