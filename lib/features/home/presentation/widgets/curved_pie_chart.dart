import 'dart:math';
import 'package:flutter/material.dart';

class CurvedPieChart extends StatelessWidget {
  final List<double> sections;
  const CurvedPieChart({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: CustomPaint(
          painter: PieChartPainter(
            sections: sections,
          ),
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<double> sections;
  PieChartPainter({required this.sections});
  final List<MaterialColor> colors = [
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.yellow
  ];

  final double strokeWidth = 20.0;
  final double arcGap = 15;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth;

    double startAngle = pi / 20;
    final List<double> values = sections;
    final double total = values.reduce((a, b) => a + b);

    for (int i = 0; i < values.length; i++) {
      double sweepAngle = (values[i] / total) * (2 * pi);

      Paint paint = Paint()
        ..shader = SweepGradient(
          startAngle: startAngle,
          endAngle: startAngle + sweepAngle - arcGap * pi / 180,
          colors: [
            colors[i % colors.length][900]!,
            colors[i % colors.length][600]!,
            colors[i % colors.length][400]!,
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(
          Rect.fromCircle(center: center, radius: radius),
        )
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle - arcGap * pi / 180,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
