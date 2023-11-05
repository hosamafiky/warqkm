import 'dart:convert';

import 'package:flutter/services.dart';

class CountriesHelper {
  static final CountriesHelper _instance = CountriesHelper._internal();

  factory CountriesHelper() => _instance;

  CountriesHelper._internal();

  List<Country> get countries => _countries;
  List<Country> _countries = [];

  Future<void> getCountries() async {
    try {
      String data = await rootBundle.loadString('assets/countries.json');
      _countries = List<Country>.from(json.decode(data).map((e) => Country.fromJson(e)));
    } catch (e) {
      print(e.toString());
      _countries = [];
    }
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
