import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:warqkm/core/helpers/countries_helper.dart';
import 'package:warqkm/core/helpers/router_helper.dart';
import 'package:warqkm/core/themes/light/light_theme_data.dart';
import 'package:warqkm/features/auth/presentation/pages/login_screen.dart';
import 'package:warqkm/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([EasyLocalization.ensureInitialized(), CountriesHelper().parseCountriesInBG()]);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final routerHelper = RouterHelper();
        return MaterialApp(
          title: 'ورقكم',
          theme: lightTheme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: routerHelper.onGenerateRoute,
          initialRoute: LoginScreen.routeName,
        );
      },
    );
  }
}
