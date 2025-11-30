import 'package:hive/hive.dart';

part 'tag_model.g.dart';

@HiveType(typeId: 1)
class TagModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  TagModel({required this.id, required this.name});

  TagModel copyWith({int? id, String? name}) {
    return TagModel(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  String toString() {
    return 'TodoModel(id: $id, name: $name)';
  }
}
