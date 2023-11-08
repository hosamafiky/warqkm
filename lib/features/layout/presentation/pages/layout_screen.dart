// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/features/layout/presentation/pages/more_screen.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../widgets/custom_nav_bar.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = '/layout';
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<dynamic> navBarItems = [
    {
      'label': LocaleKeys.layout_home.tr(),
      'screen_title': LocaleKeys.layout_home.tr(),
      'icon': 'home',
    },
    {
      'label': LocaleKeys.layout_cart.tr(),
      'screen_title': LocaleKeys.layout_cart.tr(),
      'icon': 'cart',
    },
    {
      'label': LocaleKeys.layout_my_purchases.tr(),
      'screen_title': LocaleKeys.layout_purchases.tr(),
      'icon': 'purchases',
    },
    {
      'label': LocaleKeys.layout_more.tr(),
      'screen_title': LocaleKeys.layout_more.tr(),
      'screen': const MoreScreen(),
      'icon': 'more',
    },
  ];

  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (context, index, child) {
        return Scaffold(
          appBar: AppBar(title: Text(navBarItems[index]['screen_title'])),
          body: navBarItems[index]['screen'] ??
              const Center(
                child: Text('تحت الإنشاء'),
              ),
          bottomNavigationBar: CustomNavBarWidget(
            currentIndex: currentIndex.value,
            onTap: (index) => currentIndex.value = index,
            navBarItems: navBarItems,
          ),
        );
      },
    );
  }
}
