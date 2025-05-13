import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class InnerGlowingWidget extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;
  final double glowWidth;
  final double blure;
  final List<Color> colors;

  const InnerGlowingWidget({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.glowWidth,
    required this.blure,
    required this.colors,
  });

  @override
  State<InnerGlowingWidget> createState() => _InnerGlowingWidgetState();
}

class _InnerGlowingWidgetState extends State<InnerGlowingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.child,
            AnimatedBuilder(
              animation: _controller,
              builder:
                  (_, __) => CustomPaint(
                    painter: _GlowPainter(
                      animationValue: _controller.value,
                      colors: widget.colors,
                      borderRadius: widget.borderRadius,
                      glowWidth: widget.glowWidth,
                      blure: widget.blure,
                    ),
                    child: const SizedBox.expand(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowPainter extends CustomPainter {
  final double animationValue;
  final List<Color> colors;
  final double borderRadius;
  final double glowWidth;
  final double blure;

  _GlowPainter({
    required this.animationValue,
    required this.colors,
    required this.borderRadius,
    required this.glowWidth,
    required this.blure,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final RRect roundedRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final stops = List.generate(colors.length + 1, (i) => i / (colors.length));

    final sweepGradient = SweepGradient(
      startAngle: 0.0,
      endAngle: 2 * pi,
      colors: [...colors, colors.first],
      stops: stops,
      transform: GradientRotation(2 * pi * animationValue),
    );

    final Paint glowStrokePaint =
        Paint()
          ..shader = sweepGradient.createShader(rect.inflate(glowWidth))
          ..style = PaintingStyle.stroke
          ..strokeWidth = glowWidth
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blure);

    canvas.drawRRect(roundedRect.deflate(1.0), glowStrokePaint);
  }

  @override
  bool shouldRepaint(covariant _GlowPainter oldDelegate) {
    return animationValue != oldDelegate.animationValue ||
        colors != oldDelegate.colors ||
        borderRadius != oldDelegate.borderRadius;
  }
}
