import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class GreyContainer extends StatelessWidget {
  final Widget? child;

  /// 회색 컨테이너
  const GreyContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.greyContainerHeight,
      padding: EdgeInsets.symmetric(horizontal: AppSize.containerPaddingS),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        borderRadius: BorderRadius.circular(AppSize.containerRadiusS),
      ),
      child: child,
    );
  }
}
