import 'package:flutter/material.dart';
import 'package:localization_app/localization/localization_constants.dart';
import 'package:localization_app/main.dart';
import 'package:localization_app/models/language_model.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(
            context,
            'settings',
          ),
        ),
      ),
      body: Center(
        child: DropdownButton<LanguageModel>(
          underline: SizedBox(),
          hint: Text(
            getTranslated(
              context,
              'select_lang',
            ),
          ),
          onChanged: (val) async {
            Locale temp = await setLocale(val.languageCode);
            MyApp.setLocale(context, temp);
          },
          icon: Icon(Icons.arrow_drop_down_outlined),
          iconSize: 30,
          iconEnabledColor: Colors.indigo,
          iconDisabledColor: Colors.grey,
          items: LanguageModel.languagesList()
              .map(
                (lang) => DropdownMenuItem(
                  child: Text(
                    lang.name,
                  ),
                  value: lang,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
