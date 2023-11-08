// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/themes/light/light_colors.dart';

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({
    super.key,
    this.onImageChanged,
    this.isAbleToEdit = true,
  }) : assert(onImageChanged == null && !isAbleToEdit || onImageChanged != null && isAbleToEdit);

  final Function(File)? onImageChanged;
  final bool isAbleToEdit;

  Future<File?> _pickImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) return File(xFile.path);
    return null;
  }

  ValueNotifier<File?> profileImage = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: profileImage,
      builder: (context, image, child) {
        return Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            CircleAvatar(
              radius: 36.aw,
              backgroundColor: Theme.of(context).cardColor,
              backgroundImage: image != null ? FileImage(image) : null,
            ),
            if (isAbleToEdit) ...[
              InkWell(
                onTap: () async {
                  profileImage.value = await _pickImage();
                  if (profileImage.value != null) onImageChanged!(profileImage.value!);
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
          ],
        );
      },
    );
  }
}
