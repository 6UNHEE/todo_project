import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/providers/user_image_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class ProfileImage extends ConsumerWidget {
  /// 사용자 프로필 이미지
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.read(userImageNotifierProvider.notifier);
    final imagePath = ref.watch(userImageNotifierProvider);

    return GestureDetector(
      onTap: () {
        // 클릭 시 dialog로 수정/삭제/취소 표시
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: '프로필 이미지',
            actions: [
              //#region 수정
              ElevatedButton(
                onPressed: () async {
                  // 갤러리에서 이미지 불러오기
                  await imageProvider.pickProfileImage();

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text('수정'),
              ),
              //#endregion

              //#region 삭제
              ElevatedButton(
                onPressed: () {
                  imageProvider.deleteProfileImage();

                  Navigator.pop(context);
                },
                child: Text('삭제'),
              ),
              //#endregion

              //#region 취소
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('취소'),
              ),
              //#endregion
            ],
          ),
        );
      },
      child: CircleAvatar(
        radius: AppSize.iconSizeL,
        backgroundColor: AppTheme.lightGray,
        backgroundImage: imagePath != null ? FileImage(File(imagePath)) : null,
        child: imagePath == null
            ? Icon(Icons.person, size: AppSize.iconSizeL, color: Colors.white)
            : null,
      ),
    );
  }
}
