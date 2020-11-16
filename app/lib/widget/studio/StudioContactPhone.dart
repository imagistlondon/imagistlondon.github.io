import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/A.dart';
import 'package:app/text/P.dart';
import 'package:flutter/material.dart';

class StudioContactPhone extends StatelessWidget {
  const StudioContactPhone({Key key, @required this.contentVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;

  @override
  Widget build(BuildContext context) {
    return A(
        url: contentVN.value.STUDIO_PHONE,
        phone: true,
        lineDuration: Design.STUDIO_ANCHOR_LINE_DURATION,
        lineCurve: Design.STUDIO_ANCHOR_LINE_CURVE,
        lineColor: Design.STUDIO_ANCHOR_LINE_COLOR,
        child: P(
          text: contentVN.value.STUDIO_PHONE,
        ));
  }
}
