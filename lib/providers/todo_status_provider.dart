import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/enums/todo_status_enum.dart';
import 'package:todo_project/services/todo_status_service.dart';

final statusServiceProvider = Provider<TodoStatusService>(
  (ref) => TodoStatusService(),
);

final statusProvider =
    StateNotifierProvider<TodoStatusNotifier, TodoStatusEnum>((ref) {
      final service = ref.read(statusServiceProvider);
      return TodoStatusNotifier(service);
    });

class TodoStatusNotifier extends StateNotifier<TodoStatusEnum> {
  final TodoStatusService _statusService;

  TodoStatusNotifier(this._statusService) : super(TodoStatusEnum.all);

  /// 필터 설정
  void updateStatus({required TodoStatusEnum status}) {
    _statusService.updateStatus(status: status);
    state = _statusService.selectedStatus;
  }
}
