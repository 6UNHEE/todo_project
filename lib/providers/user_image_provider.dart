import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_project/services/user_image_service.dart';

final userImageServiceProvider = Provider<UserImageService>(
  (ref) => UserImageService(),
);

final userImageNotifierProvider =
    StateNotifierProvider<UserImageNotifier, XFile?>((ref) {
      final service = ref.read(userImageServiceProvider);
      return UserImageNotifier(service);
    });

class UserImageNotifier extends StateNotifier<XFile?> {
  final UserImageService _service;

  UserImageNotifier(this._service) : super(null);

  /// 프로필 사진 업로드
  Future<void> pickProfileImage() async {
    await _service.pickProfileImage();
    state = _service.profileImage;
  }

  /// 프로필 사진 삭제
  void deleteProfileImage() {
    _service.deleteProfileImage();
    state = _service.profileImage;
  }
}
