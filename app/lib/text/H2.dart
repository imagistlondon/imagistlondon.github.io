import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

// <h2>
class H2 extends StatelessWidget {
  const H2(
      {Key key,
      this.text = 'Text',
      this.textAlign = TextAlign.left,
      this.style,
      this.opacity})
      : super(key: key);

  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = Break.decide(
        context, Design.X1_H2, Design.X2_H2, Design.X3_H2, Design.X4_H2);

    // merge
    TextStyle s = style != null ? _style.merge(style) : _style;

    // opacity
    if (opacity != null) s = s.copyWith(color: s.color.withOpacity(opacity));

    return Text(text, textAlign: textAlign, style: s);
  }
}
