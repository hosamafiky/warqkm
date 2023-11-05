import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
    this.data, {
    super.key,
    this.decoration,
    required this.onPressed,
  });

  final String data;
  final TextDecoration? decoration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: Theme.of(context).textButtonTheme.style?.copyWith(
              textStyle: MaterialStatePropertyAll(
                Theme.of(context).textButtonTheme.style?.textStyle?.resolve({MaterialState.selected})?.copyWith(
                  decoration: decoration,
                ),
              ),
            ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(data),
      ),
    );
  }
}
