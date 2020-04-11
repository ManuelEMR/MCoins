import 'package:flutter/material.dart';

class Screen {
  final Widget _screen;
  final String _screenName;

  Screen(this._screen)
      : assert(_screen != null),
        _screenName = _screen.runtimeType.toString();

  Widget get get => _screen;

  Future<T> pushSelf<T>(BuildContext context) {
    final settings = RouteSettings(name: _screenName);
    return Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: false,
          settings: settings,
          builder: (context) => _screen),
    );
  }

  Future<T> pushAndRemoveUntil<T>(
      BuildContext context, RoutePredicate predicate) {
    final settings = RouteSettings(name: _screenName);
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            fullscreenDialog: false,
            settings: settings,
            builder: (context) => _screen),
        predicate);
  }

  Future<T> show<T>(BuildContext context) {
    final settings = RouteSettings(name: _screenName);
    return Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          settings: settings,
          builder: (context) => _screen),
    );
  }
}
