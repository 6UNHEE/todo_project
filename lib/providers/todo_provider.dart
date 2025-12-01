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
///
/// 추가 / 삭제 / 수정 기능 담당
class TodoNotifier extends StateNotifier<List<TodoModel>> {
  final TodoService _todoService;

  TodoNotifier(this._todoService) : super([]) {
    loadTodo();
  }

  /// 앱 시작시 To do list 불러오기
  void loadTodo() async {
    state = await _todoService.loadTodo();
  }

  /// To do 리스트 추가
  Future<void> addList({required TodoModel todo}) async {
    state = [...state, todo];
    await _todoService.saveTodo(todo: todo);
  }

  /// To do 리스트 삭제
  Future<void> deleteList({required int id}) async {
    state = state.where((todo) => todo.id != id).toList();
    await _todoService.deleteTodo(id: id.toString());
  }

  /// 체크박스 활성/비활성화
  void toggleCheck({required int index, required bool isDone}) async {
    final newList = [...state];
    newList[index] = newList[index].copyWith(isDone: isDone);
    state = newList;
    await _todoService.saveTodo(todo: state[index]);
  }
}
