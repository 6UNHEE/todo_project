import 'package:hive/hive.dart';
import 'package:todo_project/models/tag_model.dart';

/// 태그 관련 Service
class TagService {
  final _tagbox = Hive.box<TagModel>("tagbox");

  final List<TagModel> _tagList = [];

  List<TagModel> get tagList => _tagList;

  /// 앱 시작 시 전체 태그 불러오기
  void loadTag() {
    final savedTags = tag;
    _tagList.clear();
    _tagList.addAll(savedTags);
  }

  /// 중복 검사
  bool isDuplicate({required String name}) {
    return _tagList.any((tag) => tag.name == name);
  }

  /// 태그 추가
  void addTag({required TagModel tag}) {
    if (isDuplicate(name: tag.name)) return;

    _tagList.add(tag);
  }

  /// 태그 삭제
  void removeTag({required int index}) {
    _tagList.removeAt(index);
  }

  /// 태그 수정
  void updateTag({required String newName}) {
    if (isDuplicate(name: newName)) return;
    final index = _tagList.indexWhere((tag) => tag.name == newName);

    _tagList[index] = _tagList[index].copyWith(name: newName);
  }

  /// 태그 모델 저장
  Future<void> saveTag({required TagModel tag}) async {
    // toString() 한 이유는 HiveError: Integer keys need to be in the range 0 - 0xFFFFFFFF 오류때문에
    // key를 다르게 해줘야 덮어쓰기가 되지않음 !
    await _tagbox.put(tag.id.toString(), tag);
  }

  /// 저장된 태그 이름 불러오기
  List<TagModel> get tag => _tagbox.values.toList();
}
