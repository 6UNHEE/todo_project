import 'package:hive/hive.dart';
import 'package:todo_project/models/tag_model.dart';
import 'package:todo_project/utils/logger.dart';

/// 태그 관련 Service
class TagService {
  final _tagbox = Hive.box<TagModel>("tagbox");

  /// 저장된 TagModel 반환
  List<TagModel> get tagList => _tagbox.values.toList();

  /// 앱 시작 시 저장된 태그 불러오기
  Future<List<TagModel>> loadTag() async {
    return _tagbox.values.toList();
  }

  /// 태그 모델 저장
  Future<void> saveTag({required TagModel tag}) async {
    // toString() 한 이유는 HiveError: Integer keys need to be in the range 0 - 0xFFFFFFFF 오류때문에
    // key를 다르게 해줘야 덮어쓰기가 되지않음!
    await _tagbox.put(tag.id.toString(), tag);
    logger.d('저장되어있는 태그: $tag');
  }

  /// 저장된 태그 삭제
  Future<void> deleteTag({required String id}) async {
    await _tagbox.delete(id);
  }

  /// 저장된 태그 수정
  Future<void> updateTag({required int id, required String newName}) async {
    final preTag = _tagbox.get(id); // 기존 태그
    if (preTag != null) {
      final updateTag = preTag.copyWith(name: newName);
      await _tagbox.put(id.toString(), updateTag);
      logger.d('태그 이름 수정 완료: $newName');
    }
  }
}
