import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/utils/logger.dart';

final tagProvider = StateNotifierProvider<TagNotifier, List<TagModel>>(
  (ref) => TagNotifier(),
);

/// Tag 관련 상태
class TagNotifier extends StateNotifier<List<TagModel>> {
  TagNotifier() : super([]);

  // 중복 검사 메소드
  bool isDuplicate(String name) {
    return state.any((tag) => tag.name == name);
  }

  /// Tag 추가
  void addTag({required TagModel tag}) {
    if (!isDuplicate(tag.name)) {
      state = [...state, tag];
    }
  }

  /// Tag 삭제
  void removeTag({required int index}) {
    final newList = [...state];
    newList.removeAt(index);
    state = newList;
  }

  /// Tag 수정
  void updateTag({required int id, required String newName}) {
    if (!isDuplicate(newName)) {
      state = state
          .map((tag) => tag.id == id ? tag.copyWith(name: newName) : tag)
          .toList();

      logger.d(state);
    }
  }
}
