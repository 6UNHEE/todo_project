/// To do 모델
// id, 제목, 이미지(옵션), 태그, created_at, updated_at
class TodoModel {
  final int id;
  final String title;
  final String? tag;
  final String createdAt;
  final String? updatedAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.tag,
    required this.createdAt,
    required this.updatedAt,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    String? tag,
    String? createdAt,
    String? updatedAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      tag: tag ?? this.tag,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, tag: $tag, createdAt: $createdAt, $updatedAt: $updatedAt)';
  }
}
