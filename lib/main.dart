import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zidotask/I10n/AppLanguage.dart';
import 'package:zidotask/I10n/app_localizations.dart';
import 'package:zidotask/home.dart';
import 'package:zidotask/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});
  @override
  Widget build(BuildContext context) {
     
      return ChangeNotifierProvider(
        create: (_) => appLanguage,
        child: Consumer<AppLanguage>(
          builder: (context, model, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate
              ],
              supportedLocales: [
                Locale("en", "US"),
                Locale("ar", ""),
              ],
              locale: model.appLocal,
title: 'Zido Hiring task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: mainColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
            ),
      ),
      home: HomePage(),
            );
          },
        ));
  
  }
}
