import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/todo_image_provider.dart';

class UploadImage extends ConsumerWidget {
  /// 이미지 업로드 버튼
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        await ref.read(todoImageNotifierProvider.notifier).pickImage();
      },
      icon: Icon(Icons.image),
    );
  }
}
