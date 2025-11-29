import 'package:hive/hive.dart';

/// 태그 관련 Service
class TagService {
  final _tagbox = Hive.box("tagbox");

  static const String tagNameKey = 'tagName';

  /// 태그 이름 저장
  Future<void> saveTagName({required String tagName}) async {
    await _tagbox.put(tagNameKey, tagName);
  }

  /// 저장된 태그 이름 불러오기
  String get tagName => _tagbox.get(tagNameKey);
}
