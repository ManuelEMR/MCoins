import 'package:flutter/material.dart';

import 'gradient_box_decoration.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: GradientBoxDecoration(
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorLight
        ],
      ),
      child: child,
    );
  }
}
