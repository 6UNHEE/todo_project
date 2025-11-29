import 'package:flutter/material.dart';
import 'package:todo_project/common/widgets/grey_container.dart';
import 'package:todo_project/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  /// TextFormField 위젯
  final Function(String value)? onChanged;
  final Widget? hint;
  final String? hintText;
  final Widget? prefixIcon;
  final Key? globalKey;
  final String? Function(String? value)? validate;
  final String? initialValue;

  const CustomTextField({
    super.key,
    this.onChanged,
    this.hint,
    this.hintText,
    this.prefixIcon,
    this.globalKey,
    this.validate,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return GreyContainer(
      child: Form(
        key: globalKey,
        child: TextFormField(
          onChanged: onChanged,
          validator: validate,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hint: hint,
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            prefixIconColor: AppTheme.charcoal,
          ),
        ),
      ),
    );
  }
}
