import 'package:MCoins/presentation/foundation/views/platform_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

class PlatformApp extends StatelessWidget {
  final Widget child;
  final _localizationDelegates = <LocalizationsDelegate<dynamic>>[
    GlobalMaterialLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];

  final _supportedLocales = [
    const Locale('en', "US"),
    const Locale('es', "EN"),
  ];

  final ThemeData themeData = ThemeData(
    primaryColor: const Color(0xff8c3599),
    primaryColorLight: const Color(0xffb76fbc),
    primaryColorDark: const Color(0xff4f2276),
    accentColor: const Color(0xff34E641),
    fontFamily: 'Montserrat',
  );

  PlatformApp({this.child});

  @override
  Widget build(BuildContext context) {
    return PlatformWidgetBuilder(
      androidBuilder: buildAndroid,
      iosBuilder: buildIOS,
    );
  }

  Widget buildAndroid(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      localizationsDelegates: _localizationDelegates,
      supportedLocales: _supportedLocales,
      home: I18n(child: child),
    );
  }

  Widget buildIOS(BuildContext context) {
    return Theme(
      data: themeData,
      child: CupertinoApp(
        theme: const CupertinoThemeData(
          primaryColor: Color(0xff8c3599),
          primaryContrastingColor: Color(0xff429935),
        ),
        localizationsDelegates: _localizationDelegates,
        supportedLocales: _supportedLocales,
        home: I18n(child: child),
      ),
    );
  }
}
