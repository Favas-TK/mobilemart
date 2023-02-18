

import 'package:flutter/material.dart';
import 'package:mobilemart/extra/res/colors.dart';

class WelcomeCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = blulight
      ..style = PaintingStyle.fill;
    Path path = Path()
      ..moveTo(
        size.width * 0.2,
        0,
      )
      ..lineTo(
        size.width * 0.8,
        size.height,
      )
      ..lineTo(
        size.width,
        size.height * .7,
      )
      ..lineTo(
        size.width,
        0,
      )
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
