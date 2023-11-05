import 'package:flutter/material.dart';

class CustomDropdownButton<T extends Object?> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.value,
    this.hint,
    this.icon,
    this.values = const [],
    required this.onChanged,
  });

  final Widget? hint, icon;
  final T? value;
  final List<T> values;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      hint: hint,
      icon: icon,
      items: values
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e as String),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
