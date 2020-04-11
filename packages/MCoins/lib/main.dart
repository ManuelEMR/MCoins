import 'package:MCoins/presentation/di/di_config.dart';
import 'package:MCoins/presentation/di/presentation_module.dart';
import 'package:MCoins/presentation/foundation/views/platform_app.dart';
import 'package:MCoins/presentation/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupDI([PresentationModule()]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      child: HomeScreen(),
    );
  }
}
