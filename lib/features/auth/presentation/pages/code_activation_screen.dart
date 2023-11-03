import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/shared_widgets/custom_text_form_field.dart';
import 'package:warqkm/core/themes/light/light_colors.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

class ActivationCodeScreen extends StatefulWidget {
  static const String routeName = '/activate';
  const ActivationCodeScreen({super.key});

  @override
  State<ActivationCodeScreen> createState() => _ActivationCodeScreenState();
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  List<String> codeDigits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.auth_account_activation.tr()),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CodePinWidget(
                            onSaved: (p0) {
                              if (p0 != null) codeDigits.add(p0);
                            },
                            onEmptied: () {
                              codeDigits.clear();
                            },
                          ),
                          CodePinWidget(
                            onSaved: (p1) {
                              if (p1 != null) codeDigits.add(p1);
                            },
                            onEmptied: () {
                              codeDigits.removeLast();
                            },
                          ),
                          CodePinWidget(
                            onSaved: (p2) {
                              if (p2 != null) codeDigits.add(p2);
                            },
                            onEmptied: () {
                              codeDigits.removeLast();
                            },
                          ),
                          CodePinWidget(
                            onSaved: (p3) {
                              if (p3 != null) codeDigits.add(p3);
                            },
                            isEnd: true,
                            onEmptied: () {
                              codeDigits.removeLast();
                            },
                          ),
                        ],
                      ),
                      31.vsb,
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                codeDigits.reversed.join(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
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

class CodePinWidget extends StatelessWidget {
  const CodePinWidget({
    super.key,
    required this.onSaved,
    this.isEnd = false,
    required this.onEmptied,
  });

  final Function(String?) onSaved;
  final VoidCallback onEmptied;
  final bool isEnd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67.aw,
      height: 48.aw,
      child: CustomTextFormField(
        keyboardType: TextInputType.number,
        hintText: '0',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: LightAppColors.primaryColor),
          borderRadius: BorderRadius.circular(10.asp),
        ),
        textAlign: TextAlign.center,
        onChanged: (digit) {
          if (digit?.length == 1) {
            if (isEnd) {
              FocusScope.of(context).unfocus();
            } else {
              FocusScope.of(context).nextFocus();
            }
            onSaved.call(digit);
          } else {
            FocusScope.of(context).previousFocus();
            onEmptied.call();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
