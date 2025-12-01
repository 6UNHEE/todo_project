import 'package:todo_project/enums/todo_status_enum.dart';

class TodoStatusService {
  TodoStatusEnum _selectedStatus = TodoStatusEnum.all;

  TodoStatusEnum get selectedStatus => _selectedStatus;

  /// 필터 설정
  void updateStatus({required TodoStatusEnum status}) {
    _selectedStatus = status;
  }
}
