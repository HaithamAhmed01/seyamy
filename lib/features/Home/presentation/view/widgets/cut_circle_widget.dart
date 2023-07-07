import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_colors.dart';

class QuarterCirclePainter extends CustomPainter {
  QuarterCirclePainter({required this.rotation});

  late double rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / rotation, // Starting angle (top of the circle)
      pi / 4.5, // Sweep angle (quarter circle)
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CutCircle extends StatelessWidget {
  const CutCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        children: [
          CustomPaint(
            painter: QuarterCirclePainter(rotation: 1.65),
            child: Container(),
          ),
          CustomPaint(
            painter: QuarterCirclePainter(rotation: .48),
            child: Container(),
          ),
          CustomPaint(
            painter: QuarterCirclePainter(rotation: .62),
            child: Container(),
          ),
          CustomPaint(
            painter: QuarterCirclePainter(rotation: .88),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
