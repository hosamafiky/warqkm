import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/reset-pass';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  ValueNotifier<bool> isPasswordConfVisible = ValueNotifier(false);

  @override
  void dispose() {
    _codeController.dispose();
    _passwordController.dispose();
    _passwordConfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.auth_password_reset.tr()),
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
                        25.vsb,
                        Center(
                          child: Text(
                            LocaleKeys.auth_dummy_text.tr(),
                            maxLines: 2,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        35.vsb,
                        Text(
                          LocaleKeys.auth_code.tr(),
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        11.34.vsb,
                        CustomTextFormField(
                          controller: _codeController,
                          keyboardType: TextInputType.number,
                          hintText: LocaleKeys.auth_code_hint.tr(),
                          validator: (code) {
                            if (code == null || code.isEmpty) {
                              return 'كود التفعيل مطلوب';
                            }
                            return null;
                          },
                        ),
                        14.vsb,
                        Text(
                          LocaleKeys.auth_new_password.tr(),
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
                              validator: (newPass) {
                                if (newPass == null || newPass.isEmpty) {
                                  return 'كلمة المرور الجديدة مطلوبة';
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
                        14.vsb,
                        Text(
                          LocaleKeys.auth_new_pass_conf.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        11.34.vsb,
                        ValueListenableBuilder(
                          valueListenable: isPasswordConfVisible,
                          builder: (context, isVisible, child) {
                            return CustomTextFormField(
                              controller: _passwordConfController,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: '•••••••••',
                              obscureText: !isVisible,
                              validator: (passConf) {
                                if (_passwordController.text != passConf) {
                                  return 'كلمتا المرور يجب أن يكونا متطابقين';
                                }
                                return null;
                              },
                              suffix: IconButton(
                                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  isPasswordConfVisible.value = !isPasswordConfVisible.value;
                                },
                              ),
                            );
                          },
                        ),
                        31.vsb,
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Text(LocaleKeys.auth_enter.tr()),
                        ),
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
