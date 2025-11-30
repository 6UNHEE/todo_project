import 'package:todo_project/models/todo_model.dart';

/// 현재 작성중인 할 일 관련 Service
class EditTodoService {
  TodoModel _editTodo = TodoModel(
    id: DateTime.now().millisecondsSinceEpoch,
    title: '',
    createdAt: DateTime.now().toIso8601String(),
  );

  TodoModel get editTodo => _editTodo;

  void updateTitle({required String title}) {
    _editTodo = _editTodo.copyWith(title: title);
  }
}
