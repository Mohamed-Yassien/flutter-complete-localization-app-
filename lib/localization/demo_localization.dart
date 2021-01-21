import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  Locale locale;

  DemoLocalizations(this.locale);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  Map<String, String> _localizedValues;

  Future load() async {
    final jsonStringValues = await rootBundle.loadString(
      'lang/${locale.languageCode}.json',
    );

    Map<String, dynamic> mappedValues = json.decode(jsonStringValues);

    _localizedValues = mappedValues.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
  }

  String getTranslatedValues(String key){
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationsDelegate();

}


class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations>{

  const _DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en' , 'ar'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations demoLocalizations = DemoLocalizations(locale);
    await demoLocalizations.load();
    return demoLocalizations;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;

}
