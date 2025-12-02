import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/search_provider.dart';
import 'package:todo_project/theme/app_size.dart';
import 'package:todo_project/theme/app_theme.dart';

class SearchList extends ConsumerWidget {
  /// To do 리스트 검색창
  const SearchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.appPaddingM),
      child: SizedBox(
        height: 40.0,

        child: TextFormField(
          onFieldSubmitted: (value) {
            // 엔터 누르면 검색
            ref.read(searchProvider.notifier).state = value;
          },
          decoration: InputDecoration(
            fillColor: AppTheme.lightGray,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            hintText: '검색',
            hintStyle: TextStyle(color: AppTheme.charcoal),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: AppTheme.charcoal,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
