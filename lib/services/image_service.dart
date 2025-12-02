import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// 사진 관련 Service
class ImageService {
  final ImagePicker _picker = ImagePicker();

  /// 갤러리에서 이미지 선택하여 반환
  Future<XFile?> pickImage() async {
    // 선택한 이미지의 XFile 반환, 없으면 null 반환
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  /// 이미지 저장
  ///
  /// 이미지를 앱 내부 저장소에 fileName으로 저장하고, 저장된 경로 반환
  Future<String> saveImage({
    required String originPath, // 갤러리에서 선택한 이미지 원본 경로
    required String fileName, // 앱 안에 저장할 파일 이름 (예: "profile.png")
  }) async {
    final appDir = await getApplicationDocumentsDirectory();
    final savedPath = '${appDir.path}/$fileName'; // 실제 저장할 전체 경로

    // 원본 이미지를 앱 전용 폴더로 복사
    final savedImage = await File(originPath).copy(savedPath);

    // 복사한 이미지의 경로를 반환
    return savedImage.path;
  }

  /// 저장된 이미지 불러오기
  ///
  /// 앱에 저장된 이미지가 있으면 경로를 알려주고, 없으면 null
  Future<String?> loadSavedImage({required String fileName}) async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File('${appDir.path}/$fileName'); // 파일 객체 생성
    if (await file.exists()) {
      return file.path;
    }
    return null;
  }

  /// 저장된 이미지 삭제
  Future<void> deleteSavedImage({required String fileName}) async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File('${appDir.path}/$fileName');

    if (await file.exists()) {
      await file.delete();
    }
  }
}
