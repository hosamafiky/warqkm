import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/shared_widgets/custom_text_form_field.dart';
import 'package:warqkm/core/shared_widgets/image_picker_widget.dart';
import 'package:warqkm/core/shared_widgets/phone_number_widget.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/custom_dropdown_button.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  List<String> schoolDegrees = ['إبتدائي', 'إعدادي', 'ثانوي'];

  ValueNotifier<String?> schoolDegree = ValueNotifier(null);
  ValueNotifier<File?> profileImage = ValueNotifier(null);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.auth_edit_profile.tr())),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.aw),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 32.aw),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      const Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(LocaleKeys.auth_change_pass.tr()),
                      ),
                      24.vsb,
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(LocaleKeys.auth_save.tr()),
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
