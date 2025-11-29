import 'package:hive/hive.dart';

/// 사용자 정보 관련 Service
class UserService {
  final _box = Hive.box("databox");

  static const String userNameKey = 'userName';

  /// 사용자 이름 저장
  Future<void> saveUserName({required String name}) async {
    await _box.put(userNameKey, name);
  }

  /// 저장된 이름 불러오기
  String get name => _box.get(userNameKey, defaultValue: "");
}
