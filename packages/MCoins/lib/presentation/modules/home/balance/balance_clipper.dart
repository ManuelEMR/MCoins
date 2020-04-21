import 'package:flutter/material.dart';

class BalanceClipper extends CustomClipper<Path> {
  const BalanceClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    final botLeft = Offset(0, size.height * 0.6);
    final botRight = Offset(size.width, size.height * 0.6);
    final centerControlPoint = Offset(size.width / 2, size.height);

    path.moveTo(0, 0);
    path.lineTo(botLeft.dx, botLeft.dy);
    path.quadraticBezierTo(
        centerControlPoint.dx, centerControlPoint.dy, botRight.dx, botRight.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
