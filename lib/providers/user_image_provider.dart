import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_project/services/user_image_service.dart';
import 'package:todo_project/utils/logger.dart';

final userImageServiceProvider = Provider<UserImageService>(
  (ref) => UserImageService(),
);

final userImageNotifierProvider =
    StateNotifierProvider<UserImageNotifier, String?>((ref) {
      final service = ref.read(userImageServiceProvider);
      return UserImageNotifier(service);
    });

class UserImageNotifier extends StateNotifier<String?> {
  final UserImageService _service;

  UserImageNotifier(this._service) : super(null) {
    loadSavedImage();
  }

  /// 프로필 사진 업로드
  Future<void> pickProfileImage() async {
    await _service.pickProfileImage();
    if (_service.profileImage != null) {
      state = _service.profileImage!.path;
    }
  }

  /// 프로필 사진 삭제
  void deleteProfileImage() {
    _service.deleteProfileImage();
    state = null;
  }

  /// 저장된 이미지 불러오기
  void loadSavedImage() async {
    final path = await _service.loadSavedImage();
    state = path;
  }
}
