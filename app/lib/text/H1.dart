import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

// <h1>
class H1 extends StatelessWidget {
  const H1({
    Key key,
    this.text = 'Text',
    this.textAlign = TextAlign.left,
    this.style,
    this.opacity,
    this.animateOpacity = false,
    this.animationOpacityDuration = const Duration(milliseconds: 100),
    this.animationOpacityCurve = Curves.linear,
    this.animationOpacityMin = 0.1,
    this.animationOpacityDown = false,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final double opacity;

  final bool animateOpacity;
  final Duration animationOpacityDuration;
  final Curve animationOpacityCurve;
  final double animationOpacityMin;
  final bool animationOpacityDown;

  @override
  Widget build(BuildContext context) {
    final TextStyle _style = Break.decide(
        context, Design.X1_H1, Design.X2_H1, Design.X3_H1, Design.X4_H1);

    // merge
    TextStyle s = style != null ? _style.merge(style) : _style;

    // opacity
    if (opacity != null) s = s.copyWith(color: s.color.withOpacity(opacity));

    // text
    final Text h1 = Text(text, textAlign: textAlign, style: s);

    // return normal h1
    if (!animateOpacity) return h1;

    // ANIMATE
    return AnimatedOpacity(
        opacity: animationOpacityDown ? animationOpacityMin : s.color.opacity,
        duration: animationOpacityDuration,
        curve: animationOpacityCurve,
        child: h1);
  }
}
