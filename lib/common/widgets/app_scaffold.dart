import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo/list/add_list.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final List<Widget>? actions;
  final bool? isMainScreen;

  /// 공통적으로 사용할 Scaffold 위젯
  ///
  /// `child` : 위젯
  ///
  /// `title` : 앱 바 중앙 위젯
  ///
  /// `actions` : 앱 바 우측 위젯
  ///
  /// `isMainScreen` :  true 일때 floatingActionButton 표시
  const AppScaffold({
    super.key,
    required this.child,
    this.actions,
    this.title,
    this.isMainScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: actions,
        scrolledUnderElevation: 0.0,
      ),
      floatingActionButton: (isMainScreen ?? false)
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddList(),
                );
              },
              shape: CircleBorder(),
              backgroundColor: AppTheme.lightGray,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: AppSize.iconSizeS,
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.appPaddingM,
            vertical: AppSize.appPaddingM,
          ),
          child: child,
        ),
      ),
    );
  }
}
