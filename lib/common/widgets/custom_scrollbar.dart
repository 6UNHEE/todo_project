import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;

  /// 스크롤바 위젯
  const CustomScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      radius: Radius.circular(AppSize.containerRadiusS),
      thumbVisibility: thumbVisibility ?? false,
      child: child,
    );
  }
}
