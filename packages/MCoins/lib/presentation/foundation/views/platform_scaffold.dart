import 'package:MCoins/presentation/foundation/views/platform_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformScaffold extends StatelessWidget {
  final Widget title;
  final Widget child;
  final Color backgroundColor;
  final Color appBarBackgroundColor;
  final List<Widget> actions;
  final Color actionsColor;
  final Widget leading;
  final double elevation;

  final Border cupertinoBorder;

  PlatformScaffold(
      {Key key,
      this.title,
      this.appBarBackgroundColor,
      List<Widget> barActions,
      this.actionsColor,
      this.leading,
      this.backgroundColor,
      this.elevation,
      this.cupertinoBorder,
      @required this.child})
      : actions = barActions ?? [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidgetBuilder(
        androidBuilder: (BuildContext context) => Scaffold(
              appBar: (title != null || leading != null || actions.isNotEmpty)
                  ? AppBar(
                      title: title,
                      leading: leading,
                      actions: actions,
                      backgroundColor: appBarBackgroundColor,
                      elevation: elevation,
                    )
                  : null,
              backgroundColor: backgroundColor,
              body: child,
            ),
        iosBuilder: (BuildContext context) {
          final trailing = actions.isNotEmpty ? actions[0] : null;
          return CupertinoPageScaffold(
            navigationBar:
                (title != null || leading != null || trailing != null)
                    ? CupertinoNavigationBar(
                        leading: leading,
                        middle: title,
                        trailing: trailing,
                        backgroundColor: appBarBackgroundColor,
                        actionsForegroundColor: actionsColor,
                        border: cupertinoBorder,
                      )
                    : null,
            backgroundColor: backgroundColor,
            child: child,
          );
        });
  }
}
