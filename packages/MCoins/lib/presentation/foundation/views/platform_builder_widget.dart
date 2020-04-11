import 'package:flutter/material.dart';

class PlatformWidgetBuilder extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  const PlatformWidgetBuilder(
      {@required this.androidBuilder, @required this.iosBuilder})
      : assert(androidBuilder != null),
        assert(iosBuilder != null);

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
        return androidBuilder(context);
        break;
      case TargetPlatform.iOS:
        return iosBuilder(context);
        break;
      default:
        return androidBuilder(context);
    }
  }
}
