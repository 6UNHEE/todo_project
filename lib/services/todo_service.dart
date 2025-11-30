import 'package:hive/hive.dart';
import 'package:todo_project/models/todo_model.dart';

/// To do 관련 Service
class TodoService {
  final _todobox = Hive.box<TodoModel>("todobox");

  final List<TodoModel> _todoList = [];

  List<TodoModel> get todoList => _todoList;

  // 앱 시작 시 전체 To do list 불러오기
  void loadTodo() {
    final savedTodo = todo;
    _todoList.clear();
    _todoList.addAll(savedTodo);
  }

  /// To do 추가
  void addTodo({required TodoModel todo}) async {
    _todoList.add(todo);
    await _saveTodo();
  }

  /// To do 모델 저장
  Future<void> _saveTodo() async {
    await _todobox.clear();
    for (var todo in _todoList) {
      await _todobox.put(todo.id.toString(), todo);
    }
  }

  /// 저장된 To do 목록 불러오기
  List<TodoModel> get todo => _todobox.values.toList();
}
