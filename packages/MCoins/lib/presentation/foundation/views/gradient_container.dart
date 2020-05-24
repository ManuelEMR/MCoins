import 'package:flutter/material.dart';

import 'gradient_box_decoration.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const GradientContainer({this.height, this.width, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: GradientBoxDecoration(
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorLight
        ],
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
