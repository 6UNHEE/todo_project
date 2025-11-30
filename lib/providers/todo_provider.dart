import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/services/todo_service.dart';

// UI나 다른 코드에서 언제든 ref.read(todoServiceProvider) 하면 TodoService를 쓸 수 있게 연결
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

  TodoNotifier(this._todoService) : super(_todoService.todo) {
    _todoService.loadTodo();
  }

  /// To do 리스트 추가
  void addList({required TodoModel todo}) {
    _todoService.addTodo(todo: todo);
    state = [..._todoService.todoList];
  }

  /// To do 리스트 삭제
  void deleteList({required int index}) {
    _todoService.deleteTodo(index: index);
    state = [..._todoService.todoList];
  }

  /// To do 리스트 검색
  void searchList({required String input}) {
    if (input.isEmpty) {
      state = [..._todoService.todoList];
      return;
    }
    state = _todoService.searchTodo(input: input);
  }

  /// 체크박스 활성/비활성화
  void updateCheck({required int index, required bool isDone}) {
    _todoService.updateCheck(index: index, isDone: isDone);
    state = [..._todoService.todoList];
  }
}
