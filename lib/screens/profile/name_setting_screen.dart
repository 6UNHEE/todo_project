import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
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
            final userName = ref.read(userNotifierProvider);
            await ref
                .read(userNotifierProvider.notifier)
                .saveName(name: userName);
          },
          child: Text('확인'),
        ),
      ],
      child: GreyContainer(
        child: TextField(
          onChanged: (value) {
            ref.read(userNotifierProvider.notifier).updateName(name: value);
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
