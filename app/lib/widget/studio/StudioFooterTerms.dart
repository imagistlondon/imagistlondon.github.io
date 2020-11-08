import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/A.dart';
import 'package:app/text/P.dart';
import 'package:app/util/HTML.dart';
import 'package:flutter/material.dart';

class StudioFooterTerms extends StatelessWidget {
  const StudioFooterTerms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return A(
        url: HTML.href() + 'terms',
        lineDuration: Design.STUDIO_ANCHOR_LINE_DURATION,
        lineCurve: Design.STUDIO_ANCHOR_LINE_CURVE,
        lineColor: Design.STUDIO_FOOTER_TEXT_COLOR,
        child: const P(
            text: Content.STUDIO_TERMS_TITLE,
            style: const TextStyle(color: Design.STUDIO_FOOTER_TEXT_COLOR)));
  }
}
