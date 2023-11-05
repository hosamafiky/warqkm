import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/helpers/countries_helper.dart';
import 'package:warqkm/core/themes/light/light_colors.dart';
import 'package:warqkm/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:warqkm/features/auth/presentation/pages/register_screen.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/custom_dropdown_button.dart';
import '../../../../core/shared_widgets/custom_text_button.dart';
import '../../../../core/shared_widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  String dialCode = '+966';

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.auth_login.tr()),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 31.aw),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 30.ah,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        37.vsb,
                        Center(child: Image.asset('assets/images/logo.png', width: 240.aw)),
                        53.vsb,
                        Text(
                          LocaleKeys.auth_phone_no.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        11.34.vsb,
                        Container(
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
                                    controller: _phoneController,
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
                                    onCountryChanged: (country) => dialCode = country.dialCode,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        14.vsb,
                        Text(
                          LocaleKeys.auth_password.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        11.34.vsb,
                        ValueListenableBuilder(
                          valueListenable: isPasswordVisible,
                          builder: (context, isVisible, child) {
                            return CustomTextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: '•••••••••',
                              obscureText: !isVisible,
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'كلمة المرور مطلوبة';
                                }
                                return null;
                              },
                              suffix: IconButton(
                                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  isPasswordVisible.value = !isPasswordVisible.value;
                                },
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                              },
                              child: Text(LocaleKeys.auth_forgot_pass.tr()),
                            ),
                          ],
                        ),
                        31.vsb,
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('$dialCode ${_phoneController.text}');
                            }
                          },
                          child: Text(LocaleKeys.auth_login.tr()),
                        ),
                        31.vsb,
                        Center(
                          child: CustomTextButton(
                            LocaleKeys.auth_as_guest.tr(),
                            onPressed: () {},
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.auth_no_account.tr(),
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: LightAppColors.primaryColor,
                                  ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RegisterScreen.routeName);
                              },
                              child: Text(LocaleKeys.auth_create_account.tr()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

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
  Country? currentCountry = CountriesHelper().countries.firstWhere((element) => element.dialCode == '+966');
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
