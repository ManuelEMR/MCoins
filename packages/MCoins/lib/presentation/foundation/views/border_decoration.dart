import 'package:flutter/material.dart';

class BorderDecoration extends StatelessWidget {
  final Widget child;
  final double height;
  final Color borderColor;
  final Color backgroundColor;

  const BorderDecoration(
      {this.height, this.borderColor, this.backgroundColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
      ),
      height: height,
      child: child,
    );
  }
}
