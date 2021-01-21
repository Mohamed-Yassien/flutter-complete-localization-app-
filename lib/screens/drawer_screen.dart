import 'package:flutter/material.dart';
import 'package:localization_app/localization/localization_constants.dart';
import 'package:localization_app/screens/settings_screen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.indigo,
            radius: 50,
          ),
          SizedBox(
            height: 25,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
            child: Text(
              getTranslated(context, 'settings'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              getTranslated(context, 'about_us'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
