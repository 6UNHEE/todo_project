import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/services/image_service.dart';
import 'package:todo_project/utils/logger.dart';

final userImageServiceProvider = Provider<ImageService>(
  (ref) => ImageService(),
);

final userImageNotifierProvider =
    StateNotifierProvider<UserImageNotifier, String?>((ref) {
      final service = ref.read(userImageServiceProvider);
      return UserImageNotifier(service);
    });

class UserImageNotifier extends StateNotifier<String?> {
  final ImageService _service;
  final String _fileName = 'profile.png';

  UserImageNotifier(this._service) : super(null) {
    loadSavedImage();
  }

  /// 저장된 이미지 불러오기
  void loadSavedImage() async {
    final path = await _service.loadSavedImage(fileName: _fileName);
    state = path;
  }

  /// 프로필 사진 업로드
  Future<void> pickProfileImage() async {
    final profileImage = await _service.pickImage();
    if (profileImage != null) {
      await _service.saveImage(
        originPath: profileImage.path,
        fileName: _fileName,
      );
      state = profileImage.path;
      logger.d('프로필 사진 등록');
    }
  }

  /// 프로필 사진 삭제
  void deleteProfileImage() async {
    await _service.deleteSavedImage(fileName: _fileName);
    state = null;
    logger.d('프로필 사진 삭제');
  }
}
