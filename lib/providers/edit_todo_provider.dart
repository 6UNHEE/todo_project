import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/services/edit_todo_service.dart';

final editService = Provider<EditTodoService>((ref) => EditTodoService());

final editTodoProvider = StateNotifierProvider<EditTodoNotifier, TodoModel>((
  ref,
) {
  final service = ref.read(editService);
  return EditTodoNotifier(service);
});

/// 임시 저장 상태 관리
class EditTodoNotifier extends StateNotifier<TodoModel> {
  final EditTodoService _editTodoService;

  EditTodoNotifier(this._editTodoService) : super(_editTodoService.editTodo);

  /// 임시저장 타이틀 관찰
  void updateTitle({required String title}) {
    _editTodoService.updateTitle(title: title);
    state = _editTodoService.editTodo;
  }
}
