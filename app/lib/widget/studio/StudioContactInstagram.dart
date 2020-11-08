import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/A.dart';
import 'package:app/text/P.dart';
import 'package:flutter/material.dart';

class StudioContactInstagram extends StatelessWidget {
  const StudioContactInstagram({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const A(
        url: 'https://instagram.com/' + Content.STUDIO_INSTAGRAM,
        lineDuration: Design.STUDIO_ANCHOR_LINE_DURATION,
        lineCurve: Design.STUDIO_ANCHOR_LINE_CURVE,
        lineColor: Design.STUDIO_ANCHOR_LINE_COLOR,
        child: const P(text: 'Instagram'));
  }
}
