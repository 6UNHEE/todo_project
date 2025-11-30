import 'package:todo_project/models/todo_model.dart';

/// To do 관련 Service
class TodoService {
  final List<TodoModel> _todo = [];

  List<TodoModel> get todo => _todo;

  /// To do 추가
  void addTodo({required TodoModel todo}) {
    _todo.add(todo);
  }
}
