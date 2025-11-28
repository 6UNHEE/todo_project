import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';

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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(AppSize.containerRadiusS),
      ),
      child: child,
    );
  }
}
