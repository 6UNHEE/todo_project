import 'package:flutter_riverpod/legacy.dart';

/// To do list 검색 상태 관리
final searchProvider = StateProvider<String>((ref) => '');
