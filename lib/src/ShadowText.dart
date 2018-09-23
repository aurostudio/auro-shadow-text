import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final Color opacityStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final double shadowTop;
  final double shadowLeft;
  final int maxLines;

  const ShadowText(
    this.data, {
    Key key,
    this.style,
    this.opacityStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.shadowTop,
    this.shadowLeft,
    this.maxLines,
  }) : assert(data != null);

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: shadowTop,
            left: shadowLeft,
            child: new Text(
              data,
              style: style.copyWith(color: opacityStyle),
              textAlign: textAlign,
              textDirection: textDirection,
              softWrap: softWrap,
              overflow: overflow,
              textScaleFactor: textScaleFactor,
              maxLines: maxLines,
            ),
          ),
          new Text(
            data,
            style: style,
            textAlign: textAlign,
            textDirection: textDirection,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
