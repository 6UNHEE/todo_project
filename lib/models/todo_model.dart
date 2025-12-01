import 'package:hive/hive.dart';
import 'package:todo_project/models/tag_model.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 2)
class TodoModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<TagModel> tag;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final String? updatedAt;

  @HiveField(5)
  final bool isDone;

  @HiveField(6)
  final String? imagePath;

  TodoModel({
    required this.id,
    required this.title,
    List<TagModel>? tag,
    required this.createdAt,
    this.updatedAt,
    required this.isDone,
    this.imagePath,
  }) : tag = tag ?? [];

  TodoModel copyWith({
    int? id,
    String? title,
    List<TagModel>? tag,
    String? createdAt,
    String? updatedAt,
    bool? isDone,
    String? imagePath,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tag: tag ?? this.tag,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDone: isDone ?? this.isDone,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, tag: $tag, createdAt: $createdAt, updatedAt: $updatedAt, isDone: $isDone, imagePath: $imagePath)';
  }
}
