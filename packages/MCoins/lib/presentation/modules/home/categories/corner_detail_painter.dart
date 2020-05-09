import 'package:flutter/material.dart';

class CornerDetailPainter extends CustomPainter {
  final Paint painter;

  CornerDetailPainter({@required Color color})
      : painter = Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.height * 0.2, 0);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
