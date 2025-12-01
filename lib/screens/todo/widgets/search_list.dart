import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_project/providers/search_provider.dart';
import 'package:todo_project/theme/app_theme.dart';

class SearchList extends ConsumerWidget {
  /// 리스트 검색창
  const SearchList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40.0,
      child: TextFormField(
        onFieldSubmitted: (value) {
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
        ),
      ),
    );
  }
}
