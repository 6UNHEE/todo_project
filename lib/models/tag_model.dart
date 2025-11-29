/// Tag 모델
///
/// id, name
class TagModel {
  final int id;
  final String name;

  TagModel({required this.id, required this.name});

  TagModel copyWith({int? id, String? name}) {
    return TagModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  String toString() {
    return 'TagModel(id: $id, name: $name)';
  }
}
