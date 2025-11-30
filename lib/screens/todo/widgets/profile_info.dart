import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/user_image_provider.dart';
import 'package:todo_project/providers/user_provider.dart';
import 'package:todo_project/screens/profile/profile_setting_screen.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class ProfileInfo extends ConsumerWidget {
  /// 프로필 사진, 이름 표시 위젯
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.read(userServiceProvider);
    final name = userService.name;
    final image = ref.watch(userImageNotifierProvider);

    return SizedBox(
      height: 60.0,
      child: Row(
        spacing: AppSize.appPaddingS,
        children: [
          CircleAvatar(
            radius: AppSize.iconSizeL,
            backgroundColor: AppTheme.lightGray,
            backgroundImage: image != null ? FileImage(File(image)) : null,
            child: image == null
                ? Icon(
                    Icons.person,
                    size: AppSize.iconSizeL,
                    color: Colors.white,
                  )
                : null,
          ),

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
