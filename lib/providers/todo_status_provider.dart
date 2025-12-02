import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/enums/todo_status_enum.dart';

final statusNotifierProvider =
    StateNotifierProvider.autoDispose<TodoStatusNotifier, TodoStatusEnum>(
      (ref) => TodoStatusNotifier(),
    );

/// 필터 설정 (전체/완료/진행중)
class TodoStatusNotifier extends StateNotifier<TodoStatusEnum> {
  TodoStatusNotifier() : super(TodoStatusEnum.all);

  /// 필터 설정
  void updateStatus({required TodoStatusEnum status}) {
    state = status;
  }
}
