import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_project/utils/logger.dart';

/// 프로필 사진 관련 Service
class UserImageService {
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;

  final String _fileName = 'profile_picture.png';

  XFile? get profileImage => _profileImage;

  /// 갤러리에서 이미지 선택
  Future<void> pickProfileImage() async {
    _profileImage = await _picker.pickImage(source: ImageSource.gallery);
    saveProfileImage(_profileImage!);
  }

  /// 이미지 삭제
  void deleteProfileImage() {
    _profileImage = null;
  }

  /// 이미지 저장
  Future<String> saveProfileImage(XFile image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final savedImage = await File(image.path).copy('${appDir.path}/$_fileName');
    return savedImage.path;
  }

  // 저장된 이미지 불러오기
  Future<String?> loadSavedImage() async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File('${appDir.path}/$_fileName');
    if (await file.exists()) {
      return file.path;
    }
    return null;
  }
}
