import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/name_container.dart';

class NameSettingScreen extends StatefulWidget {
  const NameSettingScreen({super.key});

  @override
  State<NameSettingScreen> createState() => _NameSettingScreenState();
}

class _NameSettingScreenState extends State<NameSettingScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text('이름'),
      actions: [
        TextButton(
          // TODO 확인 버튼 클릭 시 이름 저장
          onPressed: () {},
          child: Text('확인'),
        ),
      ],
      child: NameContainer(
        child: TextFormField(
          controller: _nameController,
          maxLength: 30,
          decoration: InputDecoration(
            hint: Text('이름 입력'),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
