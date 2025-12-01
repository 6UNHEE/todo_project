import 'package:hive/hive.dart';
import 'package:todo_project/models/todo_model.dart';

/// To do 관련 Service
class TodoService {
  final _todobox = Hive.box<TodoModel>("todobox");

  /// 앱 시작 시 저장된 To do list 불러오기
  Future<List<TodoModel>> loadTodo() async {
    return _todobox.values.toList();
  }

  /// To do 모델 저장
  Future<void> saveTodo({required TodoModel todo}) async {
    await _todobox.put(todo.id.toString(), todo);
  }

  /// 저장된 To do 삭제
  Future<void> deleteTodo({required String id}) async {
    await _todobox.delete(id);
  }

  /// 저장된 To do 수정
  Future<void> updateTodo({required TodoModel todo}) async {
    await _todobox.put(todo.id.toString(), todo);
  }
}
