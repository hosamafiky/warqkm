import 'package:flutter/material.dart';

class CustomDropdownButton<T extends Object?> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.value,
    this.hint,
    this.icon,
    this.constraints,
    this.contentPadding,
    this.isExpanded = false,
    this.isDense = true,
    this.isFilled = true,
    this.values = const [],
    required this.onChanged,
    required this.itemView,
  });

  final Widget? hint, icon;
  final bool isExpanded, isDense, isFilled;
  final Widget Function(T) itemView;
  final T? value;
  final List<T> values;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? contentPadding;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      isExpanded: isExpanded,
      isDense: isDense,
      hint: hint,
      icon: icon,
      decoration: InputDecoration(constraints: constraints, filled: isFilled, contentPadding: contentPadding),
      items: values
          .map(
            (value) => DropdownMenuItem(
              value: value,
              child: itemView(value),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
