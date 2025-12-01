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

class TodoImageNotifier extends StateNotifier<String?> {
  final ImageService _service;

  TodoImageNotifier(this._service) : super(null);

  /// 저장된 이미지 불러오기
  Future<void> loadSavedImage() async {
    final path = await _service.loadSavedImage(fileName: state ?? '');
    state = path;
  }

  /// To do 이미지 업로드
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
  Future<void> saveImage({
    required String originPath,
    required String fileName,
  }) async {
    state = await _service.saveImage(
      originPath: originPath,
      fileName: fileName,
    );
  }

  /// To do 이미지 삭제
  Future<void> deleteTodoImage({required String fileName}) async {
    await _service.deleteSavedImage(fileName: fileName);
    state = null;
    logger.d('이미지 삭제');
  }
}
