import 'package:flutter/material.dart';

class PalmAltIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PalmAltIcon({
    Key? key,
    this.size = 24.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _PalmAltIconPainter(color: color),
      ),
    );
  }
}

class _PalmAltIconPainter extends CustomPainter {
  final Color color;

  _PalmAltIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    // M7 11.5V14
    path.moveTo(size.width * 7 / 24, size.height * 11.5 / 24);
    path.lineTo(size.width * 7 / 24, size.height * 14 / 24);

    // m0-2.5v-6
    path.moveTo(size.width * 7 / 24, size.height * 11.5 / 24);
    path.lineTo(size.width * 7 / 24, size.height * 5.5 / 24);

    // a1.5 1.5 0 1 1 3 0
    path.moveTo(size.width * 7 / 24, size.height * 5.5 / 24);
    path.arcToPoint(
      Offset(size.width * 10 / 24, size.height * 5.5 / 24),
      radius: Radius.circular(size.width * 1.5 / 24),
      clockwise: true,
      largeArc: false,
    );

    // m-3 6a1.5 1.5 0 00-3 0
    path.moveTo(size.width * 7 / 24, size.height * 11.5 / 24);
    path.arcToPoint(
      Offset(size.width * 4 / 24, size.height * 11.5 / 24),
      radius: Radius.circular(size.width * 1.5 / 24),
      clockwise: false,
    );

    // v2a7.5 7.5 0 0015 0v-5a1.5 1.5 0 00-3 0
    path.lineTo(size.width * 4 / 24, size.height * 13.5 / 24);
    path.arcToPoint(
      Offset(size.width * 19 / 24, size.height * 13.5 / 24),
      radius: Radius.circular(size.width * 7.5 / 24),
      clockwise: false,
    );
    path.lineTo(size.width * 19 / 24, size.height * 8.5 / 24);
    path.arcToPoint(
      Offset(size.width * 16 / 24, size.height * 8.5 / 24),
      radius: Radius.circular(size.width * 1.5 / 24),
      clockwise: false,
    );

    // m-6-3V11
    path.moveTo(size.width * 10 / 24, size.height * 5.5 / 24);
    path.lineTo(size.width * 10 / 24, size.height * 11 / 24);

    // m0-5.5v-1a1.5 1.5 0 013 0v1
    path.moveTo(size.width * 10 / 24, size.height * 5.5 / 24);
    path.lineTo(size.width * 10 / 24, size.height * 4.5 / 24);
    path.arcToPoint(
      Offset(size.width * 13 / 24, size.height * 4.5 / 24),
      radius: Radius.circular(size.width * 1.5 / 24),
    );
    path.lineTo(size.width * 13 / 24, size.height * 5.5 / 24);

    // m0 0V11
    path.moveTo(size.width * 13 / 24, size.height * 5.5 / 24);
    path.lineTo(size.width * 13 / 24, size.height * 11 / 24);

    // m0-5.5a1.5 1.5 0 013 0v3m0 0V11
    path.moveTo(size.width * 13 / 24, size.height * 5.5 / 24);
    path.arcToPoint(
      Offset(size.width * 16 / 24, size.height * 5.5 / 24),
      radius: Radius.circular(size.width * 1.5 / 24),
    );
    path.lineTo(size.width * 16 / 24, size.height * 8.5 / 24);
    path.lineTo(size.width * 16 / 24, size.height * 11 / 24);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
