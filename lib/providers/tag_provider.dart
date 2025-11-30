import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/services/tag_service.dart';
import 'package:todo_project/utils/logger.dart';

final tagServiceProvider = Provider<TagService>((ref) => TagService());

final tagProvider = StateNotifierProvider<TagNotifier, List<TagModel>>((ref) {
  final service = ref.read(tagServiceProvider);
  return TagNotifier(service);
});

/// Tag 관련 상태
class TagNotifier extends StateNotifier<List<TagModel>> {
  final TagService _tagService;

  TagNotifier(this._tagService) : super(_tagService.tag) {
    _tagService.loadTag();
  }

  /// 중복 검사
  bool isDuplicate({required String name}) =>
      _tagService.isDuplicate(name: name);

  /// Tag 추가
  void addTag({required TagModel tag}) {
    _tagService.addTag(tag: tag);
    state = [..._tagService.tagList];
  }

  /// Tag 삭제
  void removeTag({required int index}) {
    _tagService.removeTag(index: index);
    state = [..._tagService.tagList];
  }

  /// Tag 수정
  void updateTag({required int id, required String newName}) {
    _tagService.updateTag(newName: newName);
    state = [..._tagService.tagList];
  }

  /// Tag 모델 저장
  Future<void> saveTag({required TagModel tag}) async {
    logger.d('저장한 태그 모델: $tag');
    logger.d('저장되어있는 태그 모델: $state');
    await _tagService.saveTag(tag: tag);
  }
}
