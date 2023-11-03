import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/themes/light/light_colors.dart';

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

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  ValueNotifier<File?> profileImage = ValueNotifier(null);
  ValueNotifier<bool> isConfPasswordVisible = ValueNotifier(false);

  Future<File?> _pickImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) return File(xFile.path);
    return null;
  }

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
                        child: ValueListenableBuilder(
                          valueListenable: profileImage,
                          builder: (context, image, child) {
                            return Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                CircleAvatar(
                                  radius: 36.aw,
                                  backgroundImage: image != null ? FileImage(image) : null,
                                ),
                                InkWell(
                                  onTap: () async {
                                    profileImage.value = await _pickImage();
                                  },
                                  child: Container(
                                    width: 22.aw,
                                    height: 22.aw,
                                    padding: EdgeInsets.all(4.asp),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: LightAppColors.primaryColor,
                                    ),
                                    child: Image.asset('assets/images/cam.png'),
                                  ),
                                ),
                              ],
                            );
                          },
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
                      CustomTextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        hintText: LocaleKeys.auth_phone_no_hint.tr(),
                        suffix: IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              VerticalDivider(
                                width: 2,
                                color: LightAppColors.dividerColor,
                                thickness: 1,
                                indent: 10.ah,
                                endIndent: 10.ah,
                              ),
                              10.hsb,
                              Image.asset('assets/images/saudi.png', width: 25.26.aw),
                              5.6.hsb,
                              Text(
                                '+966',
                                locale: const Locale('en'),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const Icon(Icons.keyboard_arrow_down_outlined),
                            ],
                          ),
                        ),
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
                      //TODO: implement Dropdown button
                      11.34.vsb,
                      // CustomTextFormField(
                      //   controller: _schoolDegController,
                      //   keyboardType: TextInputType.,
                      //   hintText: LocaleKeys.auth_email_hint.tr(),
                      // ),
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
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
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
