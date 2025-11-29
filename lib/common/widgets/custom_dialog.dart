import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final List<Widget>? actions;

  /// 커스텀 AlertDialog
  const CustomDialog({super.key, this.title, this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!, textAlign: TextAlign.center) : null,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
      content: content,
      actions: actions,
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
