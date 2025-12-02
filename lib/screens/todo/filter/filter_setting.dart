import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo/filter/status_filter_chip.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class FilterSetting extends StatelessWidget {
  /// 필터 설정 위젯
  const FilterSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(vertical: AppSize.appPaddingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.containerRadiusS),
          topRight: Radius.circular(AppSize.containerRadiusS),
        ),
      ),
      child: Column(
        spacing: AppSize.appPaddingL,
        children: [
          Text('필터 설정하기', style: TextStyle(color: AppTheme.charcoal)),
          StatusFilterChip(),
        ],
      ),
    );
  }
}
