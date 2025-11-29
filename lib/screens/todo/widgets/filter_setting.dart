import 'package:flutter/material.dart';
import 'package:todo_project/enums/todo_status_enum.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class FilterSetting extends StatefulWidget {
  /// 필터 설정 위젯
  const FilterSetting({super.key});

  @override
  State<FilterSetting> createState() => _FilterSettingState();
}

TodoStatusEnum selectedStatus = TodoStatusEnum.all;

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
          Row(
            spacing: AppSize.appPaddingS,
            mainAxisAlignment: MainAxisAlignment.center,
            // TODO 최적화하기 (setState 제거)
            children: TodoStatusEnum.values.map((status) {
              return ChoiceChip(
                label: Text(status.title),
                selected: selectedStatus == status,
                onSelected: (selected) {
                  selectedStatus = status;
                  setState(() {});
                },
                selectedColor: AppTheme.charcoal,
                backgroundColor: AppTheme.lightGray,
                labelStyle: TextStyle(
                  color: selectedStatus == status
                      ? Colors.white
                      : AppTheme.charcoal,
                ),
                showCheckmark: false,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
