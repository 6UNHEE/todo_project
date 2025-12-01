import 'package:flutter/material.dart';
import 'package:todo_project/screens/todo/filter/status_filter_chip.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class FilterSetting extends StatefulWidget {
  /// 필터 설정 위젯
  const FilterSetting({super.key});

  @override
  State<FilterSetting> createState() => _FilterSettingState();
}

class _FilterSettingState extends State<FilterSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.appPaddingS,
        vertical: AppSize.appPaddingS,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.containerRadiusS),
          topRight: Radius.circular(AppSize.containerRadiusS),
        ),
      ),
      child: Column(
        spacing: AppSize.appPaddingS,
        children: [
          Text('필터 설정하기', style: TextStyle(color: AppTheme.charcoal)),
          StatusFilterChip(),
        ],
      ),
    );
  }
}
