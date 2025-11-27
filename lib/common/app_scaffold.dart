import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String? appBarText;
  final List<Widget>? actions;

  /// 공통적으로 사용할 Scaffold 위젯
  ///
  /// `child` : 위젯
  ///
  /// `appBarText` : 화면 이름
  const AppScaffold({
    super.key,
    required this.child,
    this.appBarText,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText != null
            ? Text(appBarText!, style: TextStyle(fontWeight: FontWeight.bold))
            : null,
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.0),
          child: child,
        ),
      ),
    );
  }
}
