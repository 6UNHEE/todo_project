import 'package:flutter/material.dart';
import 'package:todo_project/screens/profile/profile_setting_screen.dart';
import 'package:todo_project/theme/app_size.dart';

class ProfileInfo extends StatelessWidget {
  /// 프로필 사진, 이름 표시 위젯
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.appPaddingS,
      children: [
        // TODO 프로필 사진 추가
        SizedBox(width: 50, height: 50, child: Placeholder()),

        // TODO 설정된 이름으로 설정, 기본값은 공백
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileSettingScreen()),
            ),
            child: Text('이름', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
