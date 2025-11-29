import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/custom_text_field.dart';
import 'package:todo_project/common/widgets/grey_container.dart';
import 'package:todo_project/providers/user_provider.dart';

class NameSettingScreen extends ConsumerWidget {
  /// 이름 설정
  const NameSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: Text('이름'),
      actions: [
        TextButton(
          onPressed: () async {
            final userName = ref.read(userNameProvider);
            final userService = ref.read(userServiceProvider);
            await userService.saveUserName(name: userName);
          },
          child: Text('확인'),
        ),
      ],
      child: GreyContainer(
        child: TextField(
          onChanged: (value) {
            ref.read(userNameProvider.notifier).state = value;
          },
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
