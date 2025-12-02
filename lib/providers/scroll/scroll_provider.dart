import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// =====Todolist======
/// To do list ScrollController
final todoScrollProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  return controller;
});

// =====Taglist=====
/// Tag list ScrollController
final tagScrollProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  return controller;
});

// ======editTagList===
// 리스트 추가 중에 선택한 태그 모음
final editTagScrollProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  return controller;
});

// ======selectedTagList=====
final selectedTagScrollProvider = Provider.autoDispose<ScrollController>((ref) {
  final controller = ScrollController();
  return controller;
});
