import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization_app/localization/localization_constants.dart';
import 'package:localization_app/main.dart';
import 'package:localization_app/models/language_model.dart';
import 'package:localization_app/screens/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _saveForm() {
    _fromKey.currentState.validate();
  }

  void _changeLanguage(LanguageModel lang) async {
    Locale temp = await setLocale(lang.languageCode);
    MyApp.setLocale(context, temp);
  }

  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'home_screen'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              iconSize: 25,
              underline: SizedBox(),
              onChanged: (LanguageModel lang) {
                _changeLanguage(lang);
              },
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: LanguageModel.languagesList()
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            lang.flag,
                          ),
                          Text(
                            lang.name,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fromKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  getTranslated(context, 'personal_info'),
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: getTranslated(context, 'name_hint'),
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return getTranslated(context, 'required_field');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    hintText: getTranslated(context, 'email_hint'),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return getTranslated(context, 'required_field');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    hintText: getTranslated(context, 'date_hint'),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      initialDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: _saveForm,
                  child: Text(
                    getTranslated(
                      context,
                      'save',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
