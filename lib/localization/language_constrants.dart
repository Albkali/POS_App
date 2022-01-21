import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localization.dart';

const String languagecode = 'languageCode';

//languages code
const String english = 'en';
const String farsi = 'fa';
const String arabic = 'ar';
const String hindi = 'hi';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(languagecode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(languagecode) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, 'US');
    case farsi:
      return const Locale(farsi, "IR");
    case arabic:
      return const Locale(arabic, "SA");
    case hindi:
      return const Locale(hindi, "IN");
    default:
      return const Locale(english, 'US');
  }
}

String? getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context)?.translate(key);
}