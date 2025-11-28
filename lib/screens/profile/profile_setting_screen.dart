import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/name_container.dart';
import 'package:todo_project/screens/profile/name_setting_screen.dart';
import 'package:todo_project/screens/profile/widgets/profile_image.dart';

class ProfileSettingScreen extends StatelessWidget {
  /// 프로필 설정 화면
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text('프로필'),

      child: Column(
        spacing: 50.0,
        children: [
          // TODO 프로필 사진 변경 기능
          ProfileImage(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NameSettingScreen()),
            ),
            child: NameContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이름'),
                  // TODO 설정한 이름으로 보이게 하기, 기본 값은 공백
                  Text('으니', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
