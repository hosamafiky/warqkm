import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';

import '../../translations/locale_keys.g.dart';
import '../themes/light/light_colors.dart';
import 'country_dialcode_picker.dart';
import 'custom_text_form_field.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    super.key,
    required this.controller,
    required this.onDialCodeChanged,
  });

  final TextEditingController controller;
  final Function(String) onDialCodeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(10.asp),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 19,
              child: CustomTextFormField(
                controller: controller,
                isFilled: false,
                keyboardType: TextInputType.phone,
                validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    return 'رقم الجوال مطلوب';
                  }
                  return null;
                },
                hintText: LocaleKeys.auth_phone_no_hint.tr(),
              ),
            ),
            VerticalDivider(
              width: 2,
              color: LightAppColors.dividerColor,
              thickness: 1,
              indent: 10.ah,
              endIndent: 10.ah,
            ),
            10.hsb,
            Expanded(
              flex: 8,
              child: CountryDialCodePicker(
                onCountryChanged: (country) => onDialCodeChanged(country.dialCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
