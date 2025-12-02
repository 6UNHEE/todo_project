import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/services/todo_service.dart';
import 'package:todo_project/utils/logger.dart';

final editTodoServiceProvider = Provider<TodoService>((ref) => TodoService());

final editTodoNotifierProvider =
    StateNotifierProvider.autoDispose<EditTodoNotifier, TodoModel?>((ref) {
      final service = ref.read(editTodoServiceProvider);
      return EditTodoNotifier(service);
    });

class EditTodoNotifier extends StateNotifier<TodoModel?> {
  final TodoService _service;

  EditTodoNotifier(this._service) : super(null);

  /// 저장된 TodoModel 리스트 중에 해당 id TodoModel 불러오기
  Future<void> loadSavedTodo({required int id}) async {
    final todoList = await _service.loadTodo();
    state = todoList.firstWhere((todo) => todo.id == id);
  }

  /// 체크박스 토글
  void toggleCheck({required bool isDone}) {
    if (state == null) return;
    logger.d(state);
    state = state!.copyWith(isDone: isDone);
    logger.d(state);
  }

  //// 태그 추가
  void addTag({required TagModel tag}) {
    if (state == null) return;
    final List<TagModel> tagList = List.from(state!.tag);
    logger.d('태그: $tag');
    logger.d('태그리스트: $tagList');
    if (tagList.contains(tag)) return;
    tagList.add(tag);
    state = state!.copyWith(tag: tagList);
  }

  /// 태그 삭제
  void deleteTag({required TagModel tag}) {
    if (state == null) return;
    final List<TagModel> tagList = List.from(state!.tag);
    tagList.remove(tag);
    state = state!.copyWith(tag: tagList);
  }

  /// 입력중인 타이틀 관찰
  void updateTitle({required String title}) {
    if (state == null) return;
    state = state!.copyWith(title: title);
  }

  /// 이미지 추가
  void addImage({required String? imagePath}) {
    if (state == null) return;
    if (imagePath == null) return;

    state = state!.copyWith(imagePath: imagePath, setImagePath: true);
  }

  /// 이미지 삭제
  void deleteImage() {
    if (state == null) return;

    state = state!.copyWith(imagePath: null, setImagePath: true);
  }

  /// 수정된 내용 저장
  Future<void> updateModel() async {
    if (state == null) return;
    state = state!.copyWith(updatedAt: DateTime.now().toIso8601String());
    await _service.saveTodo(todo: state!);
  }
}
