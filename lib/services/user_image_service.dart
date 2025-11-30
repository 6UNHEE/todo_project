import 'package:image_picker/image_picker.dart';

/// 프로필 사진 관련 Service
class UserImageService {
  final ImagePicker _picker = ImagePicker();

  /// 갤러리에서 이미지 선택
  Future<XFile?> pickProfileImage() async {
    final XFile? profileImage = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (profileImage != null) {
      return profileImage;
    }
    return null;
  }
}
