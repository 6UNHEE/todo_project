import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/services/todo_service.dart';

final todoServiceProvider = Provider<TodoService>((ref) => TodoService());

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>((
  ref,
) {
  final service = ref.read(todoServiceProvider);
  return TodoNotifier(service);
});

/// To do 리스트 관련 상태
class TodoNotifier extends StateNotifier<List<TodoModel>> {
  final TodoService _todoService;

  TodoNotifier(this._todoService) : super(_todoService.todo);

  /// To do 리스트 추가
  void addList({required TodoModel todo}) {
    _todoService.addTodo(todo: todo);
    state = [..._todoService.todo];
  }
}
