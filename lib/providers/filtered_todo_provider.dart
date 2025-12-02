import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/enums/todo_status_enum.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/providers/search_provider.dart';
import 'package:todo_project/providers/todo_provider.dart';
import 'package:todo_project/providers/todo_status_provider.dart';

/// UI에 표시할 Todo 리스트 상태
final filteredTodoProvider = Provider<List<TodoModel>>((ref) {
  final todo = ref.watch(todoNotifierProvider); // todo crud
  final status = ref.watch(statusNotifierProvider); // 전체,완료,미완료 필터
  final search = ref.watch(searchProvider); // 검색어
  final edit = ref.watch(editTodoNotifierProvider); // 편집 중인 To do

  List<TodoModel> filteredList = todo;

  /// 상태 필터
  filteredList = filteredList.where((todo) {
    switch (status) {
      case TodoStatusEnum.all:
        return true;
      case TodoStatusEnum.completed:
        return todo.isDone;
      case TodoStatusEnum.incompleted:
        return !todo.isDone;
    }
  }).toList();

  /// 검색어 필터
  if (search.isNotEmpty) {
    filteredList = filteredList.where((todo) {
      return todo.title.toLowerCase().contains(search.toLowerCase());
    }).toList();
  }

  return filteredList;
});
