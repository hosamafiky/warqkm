import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/core/themes/light/light_colors.dart';

ThemeData get lightTheme => ThemeData(
      fontFamily: 'URW',
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightAppColors.scaffoldBackgroundColor,
      primaryColor: LightAppColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: LightAppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.asp)),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        toolbarHeight: 103.ah,
        titleTextStyle: TextStyle(
          fontSize: 16.asp,
          fontFamily: 'URW',
          color: LightAppColors.appBarTitleColor,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.all(16.asp),
        fillColor: LightAppColors.textFieldFillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.asp),
        ),
        suffixIconColor: LightAppColors.dividerColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: LightAppColors.primaryColor,
          textStyle: TextStyle(
            fontSize: 12.asp,
            fontFamily: 'URW',
            decoration: TextDecoration.underline,
          ),
          fixedSize: Size.fromHeight(15.ah),
          padding: EdgeInsets.zero,
          visualDensity: const VisualDensity(vertical: -4.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: LightAppColors.primaryColor,
          textStyle: TextStyle(
            fontSize: 16.asp,
            fontFamily: 'URW',
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.asp),
          ),
          fixedSize: Size(100.w, 56.ah),
        ),
      ),
      textTheme: TextTheme(
        // For Fields label
        bodyMedium: TextStyle(
          color: LightAppColors.textColor1,
          fontSize: 14.asp,
          fontWeight: FontWeight.w900,
        ),
        // TextFormField input style.
        titleMedium: TextStyle(
          color: LightAppColors.textFieldtextColor,
          fontSize: 14.asp,
          fontWeight: FontWeight.w500,
        ),
        // TextFormField input style.
        displayMedium: TextStyle(
          color: LightAppColors.textColor2,
          fontSize: 12.asp,
          height: 24 / 12,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          color: LightAppColors.primaryColor,
          fontSize: 13.asp,
          height: 24 / 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
