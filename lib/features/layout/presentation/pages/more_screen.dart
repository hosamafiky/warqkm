// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:warqkm/core/extensions/res_size.dart';
import 'package:warqkm/features/auth/presentation/pages/edit_profile_screen.dart';
import 'package:warqkm/translations/locale_keys.g.dart';

import '../../../../core/shared_widgets/image_picker_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              16.vsb,
              ImagePickerWidget(isAbleToEdit: false),
              8.vsb,
              Text('منى الشناوي', style: Theme.of(context).textTheme.bodySmall),
              19.vsb,
              MoreTiles(),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreTiles extends StatelessWidget {
  MoreTiles({super.key});

  List<dynamic> tiles = [
    {
      'title': LocaleKeys.more_my_account.tr(),
      'icon': 'user',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_wallet.tr(),
      'icon': 'poket',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_invoices.tr(),
      'icon': 'purchese',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_pay_cards.tr(),
      'icon': 'cards',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_service_provider.tr(),
      'icon': 'person',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_be_provider.tr(),
      'icon': 'Group',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_favorite.tr(),
      'icon': 'hearts',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_rate_us.tr(),
      'icon': 'starrrr',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_contact_us.tr(),
      'icon': 'calll',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_complain.tr(),
      'icon': 'feather-share',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_share_app.tr(),
      'icon': 'share',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
    {
      'title': LocaleKeys.more_settings.tr(),
      'icon': 'setting',
      'onTap': (BuildContext context) => Navigator.pushNamed(context, EditProfileScreen.routeName),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.aw),
      child: Column(
        children: tiles
            .map(
              (tile) => ListTile(
                minLeadingWidth: 28.aw,
                contentPadding: EdgeInsets.zero,
                onTap: () => tile['onTap'](context),
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).cardColor,
                  radius: 16.aw,
                  child: Image.asset(
                    'assets/images/${tile['icon']}.png',
                    width: 16.aw,
                  ),
                ),
                title: Text(tile['title']),
                titleTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color(0xFF193637)),
                trailing: const Icon(Icons.keyboard_arrow_left),
              ),
            )
            .toList(),
      ),
    );
  }
}
