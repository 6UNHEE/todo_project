import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/user_image_provider.dart';
import 'package:todo_project/providers/user_name_provider.dart';
import 'package:todo_project/screens/profile/profile_setting_screen.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class ProfileInfo extends ConsumerWidget {
  /// 프로필 사진, 이름 표시 위젯
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.read(userNameNotifierProvider); // 사용자 이름
    final imagePath = ref.watch(userImageNotifierProvider); // 프로필 사진 저장 경로

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingS),
      child: SizedBox(
        height: 60.0,
        child: Row(
          spacing: AppSize.appPaddingS,
          children: [
            //#region 프로필 사진
            CircleAvatar(
              radius: AppSize.iconSizeL,
              backgroundColor: AppTheme.lightGray,
              backgroundImage: imagePath != null
                  ? FileImage(File(imagePath))
                  : null,
              child: imagePath == null
                  ? Icon(
                      Icons.person,
                      size: AppSize.iconSizeL,
                      color: Colors.white,
                    )
                  : null,
            ),
            //#endregion

            //#region 이름
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileSettingScreen(),
                  ),
                ),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //#endregion
          ],
        ),
      ),
    );
  }
}
