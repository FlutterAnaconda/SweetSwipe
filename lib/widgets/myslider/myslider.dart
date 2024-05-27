

import 'package:flutter/material.dart';



class MySlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const MySlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          trackHeight:  11,
          overlayShape: SliderComponentShape.noOverlay,
          inactiveTrackColor: const Color(0xffffffff),//D9D9D9
          thumbShape: CustomThumbShape(
              thumbWidth: 12.5, thumbHeight:5.5),
          thumbColor: const Color(0xffDC626B),

          activeTrackColor: const Color(0xffDC626B)),
      child: Slider(
        value: widget.value,
        min: widget.min,
        max: widget.max,
        onChanged: widget.onChanged,

      ),
    );
  }
}
class MySliderbg extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const MySliderbg({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  _MySliderbg createState() => _MySliderbg();
}

class _MySliderbg extends State<MySliderbg> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          trackHeight:  11,
          overlayShape: SliderComponentShape.noOverlay,
          inactiveTrackColor: const Color(0xffF0F0F2),
          thumbShape: CustomThumbShape(
              thumbWidth: 12.5, thumbHeight:5.5),
          thumbColor: const Color(0xffDC626B),

          activeTrackColor: const Color(0xffDC626B)),
      child: Slider(
        value: widget.value,
        min: widget.min,
        max: widget.max,
        onChanged: widget.onChanged,

      ),
    );
  }
}
class CustomThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;

  CustomThumbShape({
    required this.thumbWidth,
    required this.thumbHeight,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final thumbRadius = thumbWidth / 2;

    final thumbPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    final thumbCenter = center + Offset(0, thumbHeight / 170);

    context.canvas.drawCircle(thumbCenter, thumbRadius, thumbPaint);
  }
}