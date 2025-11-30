import 'package:todo_project/models/tag_model.dart';

/// To do 모델
// id, 제목, 이미지(옵션), 태그, created_at, updated_at
// `isDone` : 완료했는지 안했는지
class TodoModel {
  final int id;
  final String title;
  final List<TagModel>? tag;
  final String createdAt;
  final String? updatedAt;
  final bool? isDone;

  TodoModel({
    required this.id,
    required this.title,
    this.tag,
    required this.createdAt,
    this.updatedAt,
    this.isDone,
  });

  // copyWith
  TodoModel copyWith({
    int? id,
    String? title,
    List<TagModel>? tag,
    String? createdAt,
    String? updatedAt,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tag: tag ?? this.tag,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDone: isDone ?? this.isDone,
    );
  }

  // toString
  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, tag: $tag, createdAt: $createdAt, updatedAt: $updatedAt, isDone: $isDone)';
  }
}
