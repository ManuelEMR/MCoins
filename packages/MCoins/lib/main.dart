import 'package:MCoins/presentation/foundation/platform_app.dart';
import 'package:MCoins/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
