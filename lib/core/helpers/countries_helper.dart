import 'dart:convert';

import 'package:flutter/services.dart';

class CountriesHelper {
  static final CountriesHelper _instance = CountriesHelper._internal();

  factory CountriesHelper() => _instance;

  CountriesHelper._internal();

  List<Country> get countries => _countries;
  List<Country> _countries = [];

  Future<List<Country>> getCountries() async {
    try {
      String data = await rootBundle.loadString('assets/countries.json');
      final jsonData = json.decode(data);
      _countries = List<Country>.from(jsonData.where((e) => e['dial_code'] == '+966').map((e) => Country.fromJson(e)));
    } catch (e) {
      _countries = [];
    }

    return _countries;
  }
}

class Country {
  final String name;
  final String dialCode;
  final String flag;

  Country({required this.name, required this.dialCode, required this.flag});

  factory Country.fromJson(Map<String, dynamic> map) {
    return Country(name: map["name"], dialCode: map["dial_code"], flag: map["flag"]);
  }
}
