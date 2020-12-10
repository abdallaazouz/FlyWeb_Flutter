import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flyweb/src/data/config.dart';
import 'package:flyweb/src/helpers/HexColor.dart';
import 'package:flyweb/src/helpers/SharedPref.dart';
import 'package:flyweb/src/models/settings.dart';
import 'package:flyweb/src/pages/HomeScreen.dart';
import 'package:flyweb/src/repository/settings_service.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  final SettingsService settingsService = SettingsService();
  SharedPref sharedPref = SharedPref();
  String url = '${GlobalConfiguration().getString('base_url')}';
  Settings settings = Settings.fromSettings(
      {'url': '${GlobalConfiguration().getString('base_url')}'});

  @override
  void initState() {
    super.initState();

    initOneSignal();

    loadSharedPrefs();

    _getSettings();

    _mockCheckForSession().then((status) {
      _navigateToHome();
    });
  }

  Future<void> initOneSignal() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setRequiresUserPrivacyConsent(true);

    var settings = {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.promptBeforeOpeningPushUrl: true
    };

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      this.setState(() {});
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      this.setState(() {});
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      this.setState(() {});
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {});

    OneSignal.shared
        .setPermissionObserver((OSPermissionStateChanges changes) {});

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {});

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    await OneSignal.shared.init(
        '${GlobalConfiguration().getString('appIdOneSignal')}',
        iOSSettings: settings);

    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();

    OneSignal.shared.consentGranted(true);
  }

  Future loadSharedPrefs() async {
    try {
      var set = await sharedPref.read("settings");
      if (set != null) {
        Settings _settings = Settings.fromJson(set);
        print(_settings);
        setState(() {
          settings = _settings;
        });
      }
    } catch (Excepetion) {}
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }

  _getSettings() async {
    Settings settings = await settingsService.getSettings();
    sharedPref.save("settings", settings);
    url = settings.url;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen(url)));
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0,
                  1
                ],
                    colors: [
                  (settings.firstColor != null && settings.firstColor != "")
                      ? HexColor(settings.firstColor)
                      : HexColor(
                          '${GlobalConfiguration().getString('firstColor')}'),
                  (settings.secondColor != null && settings.secondColor != "")
                      ? HexColor(settings.secondColor)
                      : HexColor(
                          '${GlobalConfiguration().getString('firstColor')}'),
                ])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              settings.logoUrl != null
                  ? Image.network(settings.logoUrl, height: 150, width: 150)
                  : Config.logo
            ],
          ),
        ],
      ),
    );
  }
}
