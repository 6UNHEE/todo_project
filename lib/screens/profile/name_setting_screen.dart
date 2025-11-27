import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/name_container.dart';

class NameSettingScreen extends StatelessWidget {
  const NameSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(appBarText: '이름', child: NameContainer());
  }
}
