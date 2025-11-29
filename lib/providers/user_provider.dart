import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_project/services/user_service.dart';

/// 유저 이름
final userNameProvider = StateProvider<String>((ref) => "");

/// TODO 이미지 설정해주기

final userServiceProvider = Provider<UserService>((ref) => UserService());
