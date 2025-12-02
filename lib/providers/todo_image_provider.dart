import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/services/image_service.dart';
import 'package:todo_project/utils/logger.dart';

final todoImageServiceProvider = Provider<ImageService>(
  (ref) => ImageService(),
);

final todoImageNotifierProvider =
    StateNotifierProvider.autoDispose<TodoImageNotifier, String?>((ref) {
      final service = ref.read(todoImageServiceProvider);
      return TodoImageNotifier(service);
    });

/// To do list 이미지 상태 관리
class TodoImageNotifier extends StateNotifier<String?> {
  final ImageService _service;

  TodoImageNotifier(this._service) : super(null);

  /// 저장된 이미지 불러오기
  Future<void> loadSavedImage() async {
    final path = await _service.loadSavedImage(fileName: state ?? '');
    state = path;
  }

  /// 갤러리에서 이미지 불러오기
  Future<void> pickImage() async {
    final image = await _service.pickImage();
    if (image != null) {
      state = image.path;
    }
  }

  /// 업로드 한 이미지 취소
  void cancelImage() {
    state = null;
  }

  /// To do 이미지 등록
  Future<void> saveImage({required String originPath}) async {
    // 파일명을 다르게 하기 위해 DateTime.now의 마지막 4자리를 파일명에 추가
    final nowToString = DateTime.now().toString();
    final last4 = nowToString.substring(nowToString.length - 4);

    state = await _service.saveImage(
      originPath: originPath,
      fileName: 'todo$last4.png',
    );
  }

  /// To do 이미지 삭제
  Future<void> deleteTodoImage({required String fileName}) async {
    await _service.deleteSavedImage(fileName: fileName);
    state = null;
    logger.d('이미지 삭제');
  }
}
