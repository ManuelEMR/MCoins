import 'package:flutter/material.dart';

class GradientBoxDecoration extends BoxDecoration {
  GradientBoxDecoration({List<Color> colors})
      : super(
          gradient: LinearGradient(
            colors: colors,
            begin: const Alignment(0, 0),
            end: const Alignment(1, 1),
          ),
        );
}
