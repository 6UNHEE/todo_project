import 'package:flutter/material.dart';
import 'package:todo_project/theme/app_theme.dart';

class SearchList extends StatefulWidget {
  /// Todo 리스트 검색창
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: TextFormField(
        controller: _searchController,
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
