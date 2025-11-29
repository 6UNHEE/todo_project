import 'package:hive/hive.dart';

/// 사용자 정보 관련 Service
class UserService {
  final _userbox = Hive.box('userbox');

  static const String userNameKey = 'userName';

  /// 사용자 이름 저장
  Future<void> saveUserName({required String name}) async {
    await _userbox.put(userNameKey, name);
  }

  /// 저장된 이름 불러오기
  String get name => _userbox.get(userNameKey, defaultValue: "");
}
