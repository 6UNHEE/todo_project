import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/grey_container.dart';
import 'package:todo_project/providers/user_name_provider.dart';
import 'package:todo_project/screens/profile/name_setting_screen.dart';
import 'package:todo_project/screens/profile/widgets/profile_image.dart';
import 'package:todo_project/theme/app_size.dart';

class ProfileSettingScreen extends StatelessWidget {
  /// 프로필 설정 화면
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text('프로필'),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.appPaddingM,
          vertical: AppSize.appPaddingS,
        ),
        child: Column(
          spacing: 50.0,
          children: [
            //#region 프로필 사진
            ProfileImage(),
            //#endregion

            //#region 이름
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
                    //#region 사용자 이름
                    Consumer(
                      builder: (context, ref, child) {
                        final name = ref.read(userNameNotifierProvider);

                        return Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    //#endregion
                  ],
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
