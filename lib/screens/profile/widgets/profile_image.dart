import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/custom_dialog.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class ProfileImage extends StatelessWidget {
  /// 프로필 사진 업로드 위젯
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO 프로필 사진 업로드 구현, 조건 필요
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: '프로필 이미지',
            actions: [
              ElevatedButton(onPressed: () {}, child: Text('수정')),
              ElevatedButton(onPressed: () {}, child: Text('삭제')),
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
        child: Icon(Icons.person, size: AppSize.iconSizeL, color: Colors.white),
      ),
    );
  }
}
