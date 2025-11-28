import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';

class ProfileImage extends StatelessWidget {
  /// 프로필 사진 업로드 위젯
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO 프로필 사진 업로드 구현
      onTap: () {},
      child: CircleAvatar(
        radius: AppSize.profileImageSizeL,
        backgroundColor: Colors.grey[200],
        child: Icon(
          Icons.person,
          size: AppSize.profileImageSizeL,
          color: Colors.white,
        ),
      ),
    );
  }
}
