import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/grey_container.dart';
import 'package:todo_project/providers/user_provider.dart';
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
            child: GreyContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('이름'),
                  Consumer(
                    builder: (context, ref, child) {
                      final userService = ref.read(userServiceProvider);
                      final name = userService.name;

                      return Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
