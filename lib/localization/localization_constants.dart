import 'package:flutter/cupertino.dart';
import 'package:localization_app/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslatedValues(key);
}

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('code', languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale temp;
  switch (languageCode) {
    case 'en':
      temp = Locale(languageCode, 'US');
      break;
    case 'ar':
      temp = Locale(languageCode, 'EG');
      break;
    default:
      temp = Locale(languageCode, 'US');
  }
  return temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString('code');
  return _locale(languageCode);
}
