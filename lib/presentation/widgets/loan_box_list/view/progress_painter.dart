import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_horizon_challenge_app/utils/colors.dart';

class ProgressPainter extends CustomPainter {
  final double progressPercent;

  const ProgressPainter({this.progressPercent = 0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint = Paint()
      ..color = progressBg
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    Paint progressPaint = Paint()
      ..color = appPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;
    Paint shadowPaint = Paint()
      ..color = appPrimaryColor.withOpacity(0.24)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);
    Path p = Path();
    p.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 8));
    canvas.drawPath(p, shadowPaint);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2 - 8, bgPaint);

    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width - 16,
          height: size.width - 16,
        ),
        -pi / 2,
        2 * pi * (progressPercent / 100),
        false,
        progressPaint);
    Paint innerCircleBg = Paint()..color = Colors.white;
    Paint innerCircleStroke = Paint()
      ..color = appPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    var centerOfEndOfArc = Offset(size.width / 2 + sin(2 * pi * (progressPercent / 100)) * (size.width / 2 - 8),
        size.width / 2 - cos(2 * pi * (progressPercent / 100)) * (size.width / 2 - 8));
    canvas.drawCircle(centerOfEndOfArc, 14, innerCircleBg);
    canvas.drawCircle(centerOfEndOfArc, 14, innerCircleStroke);

    final textPainter = TextPainter(
      text: TextSpan(
        text: '%${progressPercent.toStringAsFixed(0)}',
        style: TextStyle(
          fontFamily: 'Vazirmatn',
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final xCenter = centerOfEndOfArc.dx - textPainter.width / 2;
    final yCenter = centerOfEndOfArc.dy - textPainter.height / 2;
    textPainter.paint(canvas, Offset(xCenter, yCenter));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
