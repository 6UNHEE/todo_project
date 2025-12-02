import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/enums/todo_status_enum.dart';
import 'package:todo_project/providers/todo_status_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class StatusFilterChip extends ConsumerWidget {
  /// 전체/완료된 일/완료되지 않은 일 필터
  const StatusFilterChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatus = ref.watch(statusNotifierProvider);

    return Row(
      spacing: AppSize.appPaddingL,
      mainAxisAlignment: MainAxisAlignment.center,
      children: TodoStatusEnum.values.map((status) {
        return ChoiceChip(
          label: Text(status.title),
          selected: selectedStatus == status,
          onSelected: (selected) {
            ref
                .read(statusNotifierProvider.notifier)
                .updateStatus(status: status);
          },
          selectedColor: AppTheme.charcoal,
          backgroundColor: AppTheme.lightGray,
          labelStyle: TextStyle(
            color: selectedStatus == status ? Colors.white : AppTheme.charcoal,
          ),
          showCheckmark: false,
        );
      }).toList(),
    );
  }
}
