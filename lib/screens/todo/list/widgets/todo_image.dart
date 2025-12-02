import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/todo_image_provider.dart';
import 'package:todo_project/theme/app_size.dart';

class TodoImage extends ConsumerWidget {
  /// 선택한 이미지
  const TodoImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(todoImageNotifierProvider);

    return imagePath == null
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingS),
            child: GestureDetector(
              onTap: () {
                // 클릭하면 이미지 삭제
                ref.read(todoImageNotifierProvider.notifier).cancelImage();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.containerRadiusS),
                child: Image.file(
                  File(imagePath),
                  width: AppSize.imageSizeS,
                  height: AppSize.imageSizeS,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}
