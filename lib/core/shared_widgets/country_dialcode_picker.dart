import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/helpers/countries_helper.dart';

import 'custom_dropdown_button.dart';

class CountryDialCodePicker extends StatefulWidget {
  const CountryDialCodePicker({
    super.key,
    required this.onCountryChanged,
  });

  final Function(Country) onCountryChanged;

  @override
  State<CountryDialCodePicker> createState() => _CountryDialCodePickerState();
}

class _CountryDialCodePickerState extends State<CountryDialCodePicker> {
  Country? currentCountry = CountriesHelper().countries.where((element) => element.dialCode == '+966').firstOrNull;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton(
      value: currentCountry,
      isDense: true,
      values: CountriesHelper().countries,
      isFilled: false,
      icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
      contentPadding: EdgeInsetsDirectional.only(end: 10.aw),
      itemView: (item) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.flag),
          5.hsb,
          Text(item.dialCode),
        ],
      ),
      onChanged: (country) {
        widget.onCountryChanged(country!);
      },
    );
  }
}
