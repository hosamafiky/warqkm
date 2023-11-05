import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.suffix,
    this.keyboardType,
    this.inputFormatters = const [],
    this.focusedBorder,
    this.onChanged,
    this.onSaved,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormatters;
  final InputBorder? focusedBorder;
  final String? hintText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (pointer) => FocusScope.of(context).unfocus(),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix,
        focusedBorder: focusedBorder,
      ),
    );
  }
}
