import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyweb/i18n/AppLanguage.dart';
import 'package:flyweb/i18n/i18n.dart';
import 'package:flyweb/src/data/config.dart';
import 'package:flyweb/src/helpers/HexColor.dart';
import 'package:flyweb/src/helpers/SharedPref.dart';
import 'package:flyweb/src/models/settings.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LanguageScreen();
  }
}

class _LanguageScreen extends State<LanguageScreen> {
  SharedPref sharedPref = SharedPref();
  Settings settings = Settings();
  List languages = Config.language;

  @override
  void initState() {
    loadSharedPrefs();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future loadSharedPrefs() async {
    try {
      Settings _settings = Settings.fromJson(await sharedPref.read("settings"));
      setState(() {
        settings = _settings;
      });
    } catch (Excepetion) {}
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

    return Scaffold(
      appBar: _renderAppBar(settings),
      body: SafeArea(
          child: Column(
        children: [
          Row(children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.translate,
                size: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(I18n.current.appLang,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Text(I18n.current.descLang,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 13,
                    ))
              ],
            )
          ]),
          Expanded(
              child: Container(
                  child: ListView.builder(
            itemCount: languages.length,
            // Add one more item for progress indicator
            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemBuilder: (BuildContext context, int index) {
              return new ListTile(
                onTap: () {
                  appLanguage
                      .changeLanguage(Locale(languages[index]['value'], ""));
                },
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black26,
                  child: Locale(languages[index]['value'], "") ==
                          appLanguage.appLocal
                      ? Container(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/img/checked.png',
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(35, 208, 101, 0.5),
                          ),
                        )
                      : null,
                  backgroundImage: ExactAssetImage(
                      'assets/img/flag/' + languages[index]['value'] + '.png'),
                ),
                title: Text(
                  languages[index]['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(languages[index]['subtitle']),
              );
            },
          ))),
        ],
      )),
    );
  }
}

Widget _renderAppBar(Settings settings) {
  return AppBar(
      title: Text(
        I18n.current.languages,
        style: TextStyle(
            color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              HexColor(settings.firstColor),
              HexColor(settings.secondColor)
            ],
          ),
        ),
      ));
}
