import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/edit_todo_provider.dart';
import 'package:todo_project/providers/todo_image_provider.dart';
import 'package:todo_project/utils/logger.dart';

class UploadImage extends ConsumerWidget {
  /// 이미지 업로드 버튼
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        await ref.read(todoImageNotifierProvider.notifier).pickImage();

        final imagePath = ref.watch(todoImageNotifierProvider);
        logger.d(imagePath);

        ref
            .read(editTodoNotifierProvider.notifier)
            .addImage(imagePath: imagePath);
      },
      icon: Icon(Icons.image),
    );
  }
}
