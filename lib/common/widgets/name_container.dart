import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class NameContainer extends StatelessWidget {
  final Widget? child;

  /// 이름 표시/설정할 때 사용하는 컨테이너
  const NameContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.nameContainerHeight,
      padding: EdgeInsets.symmetric(horizontal: AppSize.containerPaddingS),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        borderRadius: BorderRadius.circular(AppSize.containerRadiusS),
      ),
      child: child,
    );
  }
}
