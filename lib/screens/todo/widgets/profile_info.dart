import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/user_provider.dart';
import 'package:todo_project/screens/profile/profile_setting_screen.dart';
import 'package:todo_project/theme/app_size.dart';

class ProfileInfo extends ConsumerWidget {
  /// 프로필 사진, 이름 표시 위젯
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.read(userServiceProvider);
    final name = userService.name;

    return SizedBox(
      height: 60.0,
      child: Row(
        spacing: AppSize.appPaddingM,
        children: [
          // TODO 프로필 사진 추가
          SizedBox(width: 50, height: 50, child: Placeholder()),

          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSettingScreen()),
              ),
              child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
