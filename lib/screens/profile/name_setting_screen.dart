import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/common/widgets/app_scaffold.dart';
import 'package:todo_project/common/widgets/grey_container.dart';
import 'package:todo_project/providers/user_name_provider.dart';
import 'package:todo_project/theme/app_size.dart';

class NameSettingScreen extends ConsumerWidget {
  /// 이름 설정
  const NameSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(userNameNotifierProvider);
    String inputName = '';

    return AppScaffold(
      title: Text('이름'),
      actions: [
        TextButton(
          onPressed: () async {
            // 확인 버튼 클릭 시 입력한 사용자 이름 저장
            ref
                .read(userNameNotifierProvider.notifier)
                .updateName(name: inputName);
            await ref
                .read(userNameNotifierProvider.notifier)
                .saveName(name: inputName);
          },
          child: Text('확인'),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.appPaddingM,
          vertical: AppSize.appPaddingS,
        ),
        child: GreyContainer(
          child: TextFormField(
            onChanged: (value) {
              inputName = value;
            },
            initialValue: name.isEmpty ? null : name,
            maxLength: 10,
            decoration: InputDecoration(
              hintText: '이름 입력',
              border: InputBorder.none,
              counterText: '',
            ),
          ),
        ),
      ),
    );
  }
}
