import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/providers/user_image_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class ProfileImage extends ConsumerWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(userImageNotifierProvider);
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: '프로필 이미지',
            actions: [
              ElevatedButton(
                onPressed: () async {
                  await ref
                      .read(userImageNotifierProvider.notifier)
                      .pickProfileImage();

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text('수정'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(userImageNotifierProvider.notifier)
                      .deleteProfileImage();

                  Navigator.pop(context);
                },
                child: Text('삭제'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('취소'),
              ),
            ],
          ),
        );
      },
      child: CircleAvatar(
        radius: AppSize.iconSizeL,
        backgroundColor: AppTheme.lightGray,
        backgroundImage: image != null ? FileImage(File(image)) : null,
        child: image == null
            ? Icon(Icons.person, size: AppSize.iconSizeL, color: Colors.white)
            : null,
      ),
    );
  }
}
