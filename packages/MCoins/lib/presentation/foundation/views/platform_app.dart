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
      theme: ThemeData(primaryColor: Colors.orange),
      localizationsDelegates: _localizationDelegates,
      supportedLocales: _supportedLocales,
      home: I18n(child: child),
    );
  }

  Widget buildIOS(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: _localizationDelegates,
      home: I18n(child: child),
    );
  }
}
