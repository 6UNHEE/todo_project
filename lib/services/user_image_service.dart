import 'package:image_picker/image_picker.dart';

/// 프로필 사진 관련 Service
class UserImageService {
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;

  XFile? get profileImage => _profileImage;

  /// 갤러리에서 이미지 선택
  Future<void> pickProfileImage() async {
    _profileImage = await _picker.pickImage(source: ImageSource.gallery);
  }

  /// 이미지 삭제
  void deleteProfileImage() {
    _profileImage = null;
  }
}
