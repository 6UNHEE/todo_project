import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/todo_model.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>(
  (ref) => TodoNotifier(),
);

/// Todo 입력 관찰
final todoTextProvider = StateProvider<String>((ref) => "");

/// To do 리스트 관련 상태
class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  /// To do 리스트 추가
  void addList({required TodoModel todo}) {
    state = [...state, todo];
  }

  /// To do 리스트 삭제
  void removeList(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
