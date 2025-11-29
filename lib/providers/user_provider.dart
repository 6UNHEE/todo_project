import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/services/user_service.dart';

final userServiceProvider = Provider<UserService>((ref) => UserService());

final userNotifierProvider = StateNotifierProvider<UserNotifier, String>((ref) {
  final service = ref.read(userServiceProvider);
  return UserNotifier(service);
});

class UserNotifier extends StateNotifier<String> {
  final UserService _service;

  UserNotifier(this._service) : super(_service.name);

  /// 이름 관찰
  void updateName({required String name}) {
    state = name;
  }

  /// 이름 저장 + 상태 업데이트
  Future<void> saveName({required String name}) async {
    state = name;
    await _service.saveUserName(name: name);
  }

  /// 저장된 이름 불러오기
  String get name => _service.name;
}
