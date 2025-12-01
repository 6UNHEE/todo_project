import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/services/tag_service.dart';

final tagServiceProvider = Provider<TagService>((ref) => TagService());

final tagProvider = StateNotifierProvider<TagNotifier, List<TagModel>>((ref) {
  final service = ref.read(tagServiceProvider);
  return TagNotifier(service);
});

/// Tag 관련 상태
class TagNotifier extends StateNotifier<List<TagModel>> {
  final TagService _tagService;

  TagNotifier(this._tagService) : super([]) {
    loadTag();
  }

  /// 저장된 Tag 반환
  List<TagModel> get tagList => _tagService.tagList;

  /// 앱 시작 시 Tag list 불러오기
  Future<void> loadTag() async {
    state = await _tagService.loadTag();
  }

  /// 중복 검사
  bool isDuplicate({required String name}) =>
      state.any((tag) => tag.name == name);

  /// Tag 추가
  Future<void> addTag({required TagModel tag}) async {
    if (isDuplicate(name: tag.name)) return;

    state = [...state, tag];
    await _tagService.saveTag(tag: tag);
  }

  /// Tag 삭제
  Future<void> removeTag({required int id}) async {
    state = state.where((tag) => tag.id == id).toList();
    await _tagService.deleteTag(id: id.toString());
  }

  /// Tag 수정
  void updateTag({
    required int index,
    required int id,
    required String newName,
  }) async {
    if (isDuplicate(name: newName)) return;
    final newList = [...state];
    newList[index] = newList[index].copyWith(name: newName);
    state = newList;
    await _tagService.updateTag(id: id, newName: newName);
  }
}
