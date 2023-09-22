import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class ScrollingText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? speed;
  final double? pauseAfterRound;

  ScrollingText({
    required this.text,
    this.style,
    this.speed = 50.0,
    this.pauseAfterRound = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textWidth = _getTextWidth(text, style, context);

        if (textWidth > constraints.maxWidth) {
          return Marquee(
            text: text,
            style: style,
            velocity: speed!,
            pauseAfterRound: Duration(seconds: pauseAfterRound!.toInt()),
            blankSpace: 50.0,
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          );
        } else {
          return Text(text, style: style);
        }
      },
    );
  }

  double _getTextWidth(String text, TextStyle? style, BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size.width;
  }
}
