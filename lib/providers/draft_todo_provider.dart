import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/utils/logger.dart';

final draftTodoNotifierProvider =
    StateNotifierProvider.autoDispose<DraftTodoNotifier, TodoModel>(
      (ref) => DraftTodoNotifier(),
    );

/// To do list 입력중인 상태 관리 (임시저장)
class DraftTodoNotifier extends StateNotifier<TodoModel> {
  DraftTodoNotifier()
    : super(
        TodoModel(id: 0, title: '', tag: [], createdAt: '0', isDone: false),
      );

  /// 입력중인 타이틀 관찰
  void updateTitle({required String title}) {
    state = state.copyWith(title: title);
  }

  /// 입력중인 태그 추가
  void addTag({required TagModel tag}) {
    final List<TagModel> updatedList = List.from(state.tag);
    if (updatedList.contains(tag)) return;
    updatedList.add(tag);
    state = state.copyWith(tag: updatedList);
    logger.d('선택된 태그: $updatedList');
  }

  /// 입력중인 태그 삭제
  void deleteTag({required TagModel tag}) {
    final List<TagModel> tagList = List.from(state.tag);
    tagList.remove(tag);
    state = state.copyWith(tag: tagList);
    logger.d('삭제한 태그: $tag');
  }
}
