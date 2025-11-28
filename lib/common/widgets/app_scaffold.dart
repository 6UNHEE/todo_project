import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_size.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final List<Widget>? actions;

  /// 공통적으로 사용할 Scaffold 위젯
  ///
  /// `child` : 위젯
  ///
  /// `appBarText` : 화면 이름
  const AppScaffold({super.key, required this.child, this.actions, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        centerTitle: title != null,
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.appPaddingS,
            vertical: AppSize.appPaddingS,
          ),
          child: child,
        ),
      ),
    );
  }
}
