import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/A.dart';
import 'package:app/text/P.dart';
import 'package:flutter/material.dart';

class StudioContactEmail extends StatelessWidget {
  const StudioContactEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return A(
        url: Content.data.STUDIO_EMAIL,
        email: true,
        lineDuration: Design.STUDIO_ANCHOR_LINE_DURATION,
        lineCurve: Design.STUDIO_ANCHOR_LINE_CURVE,
        lineColor: Design.STUDIO_ANCHOR_LINE_COLOR,
        child: P(text: Content.data.STUDIO_EMAIL.replaceAll('@', '[at]')));
  }
}
