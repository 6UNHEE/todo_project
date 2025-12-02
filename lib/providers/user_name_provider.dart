import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/services/user_name_service.dart';

/// Notifier 안에서 Service를 쓰고 싶으면, Notifier를 생성할 때 Service를 주입

/// UserNameService 등록
///
/// 앱 전체에서 공유 가능한 인스턴스
final userNameServiceProvider = Provider<UserNameService>(
  (ref) => UserNameService(),
);

/// UserNameNotifier 등록 (UI와 Notifier 연결)
final userNameNotifierProvider =
    StateNotifierProvider<UserNameNotifier, String>((ref) {
      final service = ref.read(userNameServiceProvider);
      return UserNameNotifier(service);
    });

/// 사용자 이름 상태 관리
class UserNameNotifier extends StateNotifier<String> {
  final UserNameService _service;

  UserNameNotifier(this._service) : super(_service.name);

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
