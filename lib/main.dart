import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flyweb/i18n/AppLanguage.dart';
import 'package:flyweb/i18n/i18n.dart';
import 'package:flyweb/src/enum/connectivity_status.dart';
import 'package:flyweb/src/helpers/ConnectivityService.dart';
import 'package:flyweb/src/pages/SplashScreen.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configuration");
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      builder: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return StreamProvider<ConnectivityStatus>(
            builder: (context) =>
                ConnectivityService().connectionStatusController,
            child: MaterialApp(
                locale: model.appLocal,
                localizationsDelegates: [
                  I18n.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: I18n.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                home: SplashScreen()));
      }),
    );
  }
}
