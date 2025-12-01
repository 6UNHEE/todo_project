import 'package:hive/hive.dart';
import 'package:todo_project/enums/todo_status_enum.dart';
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

  /// To do 삭제
  void deleteTodo({required int index}) async {
    _todoList.removeAt(index);
    await _saveTodo();
  }

  /// To do 검색
  List<TodoModel> searchTodo({required String input}) {
    final query = input.trim();

    final searchList = _todoList.where((todo) {
      final titleLower = todo.title.toLowerCase();
      return query
          .split('')
          .any((char) => titleLower.contains(char.toLowerCase()));
    }).toList();

    return searchList;
  }

  /// 체크 박스 활성/비활성
  void updateCheck({required int index, required bool isDone}) {
    _todoList[index] = _todoList[index].copyWith(isDone: isDone);
  }

  /// 필터된 Todo 반환
  List<TodoModel> filterTodo({required TodoStatusEnum status}) {
    switch (status) {
      case TodoStatusEnum.all:
        return _todoList;
      case TodoStatusEnum.completed:
        return _todoList.where((todo) => todo.isDone).toList();
      case TodoStatusEnum.incompleted:
        return _todoList.where((todo) => !todo.isDone).toList();
    }
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
