/// 전체, 완료, 진행중 필터
enum TodoStatusEnum {
  all(value: 'all', title: '전체'),
  completed(value: 'completed', title: '완료'),
  incompleted(value: 'incompleted', title: '진행중');

  final String value;
  final String title;

  const TodoStatusEnum({required this.value, required this.title});
}
