import 'package:flutter/cupertino.dart';

class LanguageModel {
  final int id;
  final String name, flag, languageCode;

  LanguageModel({
    @required this.id,
    @required this.name,
    @required this.flag,
    @required this.languageCode,
  });

  static List<LanguageModel> languagesList() {
    return <LanguageModel>[
      LanguageModel(
        id: 1,
        name: 'العربية',
        flag: '🇪🇬',
        languageCode: 'ar',
      ),
      LanguageModel(
        id: 2,
        name: 'English',
        flag: '🇺🇸',
        languageCode: 'en',
      ),
    ];
  }
}
