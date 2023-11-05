import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/phone_number_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgot';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
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
                        LocaleKeys.auth_phone_no.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      11.34.vsb,
                      PhoneNumberWidget(
                        controller: _phoneController,
                        onDialCodeChanged: (dialCode) {},
                      ),
                      31.vsb,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ResetPasswordScreen.routeName);
                        },
                        child: Text(LocaleKeys.auth_send.tr()),
                      ),
                    ],
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
