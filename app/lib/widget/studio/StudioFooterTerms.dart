import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/A.dart';
import 'package:app/text/P.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:flutter/material.dart';

class StudioFooterTerms extends StatelessWidget {
  const StudioFooterTerms(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    return A(
        onTap: () {
          studioEnabledVN.value = false;
          indexVN.value = Index.TERMS;
        },
        lineDuration: Design.STUDIO_ANCHOR_LINE_DURATION,
        lineCurve: Design.STUDIO_ANCHOR_LINE_CURVE,
        lineColor: Design.STUDIO_FOOTER_TEXT_COLOR,
        child: P(
            text: contentVN.value.STUDIO_TERMS_LINK_TITLE,
            style: const TextStyle(color: Design.STUDIO_FOOTER_TEXT_COLOR)));
  }
}
