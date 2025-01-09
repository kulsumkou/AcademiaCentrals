import 'package:flutter/material.dart';

class DottedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double strokeWidth;
  final double gap;
  final BorderRadius borderRadius;

  const DottedContainer({
    Key? key,
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CustomPaint(
        painter: DottedPainter(
            color: color,
            strokeWidth: strokeWidth,
            gap: gap,
            borderRadius: borderRadius),
        child: child,
      ),
    );
  }
}

class DottedPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final BorderRadius borderRadius;

  DottedPainter(
      {required this.color,
      required this.strokeWidth,
      required this.gap,
      required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double halfGap = gap / 2;

    for (double i = 0; i < size.width; i += gap) {
      canvas.drawLine(Offset(i, 0), Offset(i + halfGap, 0), paint);
    }

    for (double i = 0; i < size.height; i += gap) {
      canvas.drawLine(
          Offset(size.width, i), Offset(size.width, i + halfGap), paint);
    }

    for (double i = size.width; i > 0; i -= gap) {
      canvas.drawLine(
          Offset(i, size.height), Offset(i - halfGap, size.height), paint);
    }

    for (double i = size.height; i > 0; i -= gap) {
      canvas.drawLine(Offset(0, i), Offset(0, i - halfGap), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
