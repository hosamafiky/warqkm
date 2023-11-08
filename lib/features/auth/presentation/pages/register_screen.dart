// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/shared_widgets/phone_number_widget.dart';
import 'package:warqkm/features/auth/presentation/pages/code_activation_screen.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/custom_dropdown_button.dart';
import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/shared_widgets/image_picker_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _schoolDegController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();

  List<String> schoolDegrees = ['إبتدائي', 'إعدادي', 'ثانوي'];

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  ValueNotifier<String?> schoolDegree = ValueNotifier(null);
  ValueNotifier<File?> profileImage = ValueNotifier(null);
  ValueNotifier<bool> isConfPasswordVisible = ValueNotifier(false);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _schoolDegController.dispose();
    _passwordController.dispose();
    _passwordConfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.auth_account_creation.tr())),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.aw),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.vsb,
                      Center(
                        child: ImagePickerWidget(
                          onImageChanged: (image) {},
                        ),
                      ),
                      24.vsb,
                      Text(
                        LocaleKeys.auth_name.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      11.34.vsb,
                      CustomTextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        hintText: LocaleKeys.auth_name_hint.tr(),
                      ),
                      14.vsb,
                      Text(
                        LocaleKeys.auth_phone_no.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      11.34.vsb,
                      PhoneNumberWidget(
                        controller: _phoneController,
                        onDialCodeChanged: (dialCode) {},
                      ),
                      14.vsb,
                      Text(
                        LocaleKeys.auth_email.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      11.34.vsb,
                      CustomTextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: LocaleKeys.auth_email_hint.tr(),
                      ),
                      14.vsb,
                      Text(
                        LocaleKeys.auth_school_degree.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      11.34.vsb,
                      CustomDropdownButton(
                        value: schoolDegree.value,
                        values: schoolDegrees,
                        itemView: (item) => Text(item),
                        hint: Text(LocaleKeys.auth_school_degree_hint.tr()),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
                        onChanged: (degree) {
                          schoolDegree.value = degree;
                        },
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
                            suffix: IconButton(
                              icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                isPasswordVisible.value = !isPasswordVisible.value;
                              },
                            ),
                          );
                        },
                      ),
                      14.vsb,
                      Text(
                        LocaleKeys.auth_password_conf.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      11.34.vsb,
                      ValueListenableBuilder(
                        valueListenable: isConfPasswordVisible,
                        builder: (context, isVisible, child) {
                          return CustomTextFormField(
                            controller: _passwordConfController,
                            keyboardType: TextInputType.visiblePassword,
                            hintText: '•••••••••',
                            obscureText: !isVisible,
                            suffix: IconButton(
                              icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                isConfPasswordVisible.value = !isConfPasswordVisible.value;
                              },
                            ),
                          );
                        },
                      ),
                      16.vsb,
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ActivationCodeScreen.routeName);
                        },
                        child: Text(LocaleKeys.auth_signup.tr()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
