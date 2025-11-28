import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;

  /// 커스텀 AlertDialog
  const CustomDialog({super.key, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      actions: actions,
      backgroundColor: Colors.white,
    );
  }
}
