import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

// <p>
class P extends StatelessWidget {
  const P(
      {Key key,
      this.text = 'Text',
      this.textAlign = TextAlign.left,
      this.style,
      this.selectable = false,
      this.opacity})
      : super(key: key);

  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final bool selectable;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = Break.decide(
        context, Design.X1_P, Design.X2_P, Design.X3_P, Design.X4_P);

    // merge
    TextStyle s = style != null ? _style.merge(style) : _style;

    // opacity
    if (opacity != null) s = s.copyWith(color: s.color.withOpacity(opacity));

    return selectable
        ? SelectableText(text, textAlign: textAlign, style: s)
        : Text(text, textAlign: textAlign, style: s);
  }
}
