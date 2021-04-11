import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/Browsers.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/studio/StudioFooterCopyright.dart';
import 'package:app/widget/studio/StudioFooterTerms.dart';
import 'package:flutter/material.dart';

class StudioFooter extends StatelessWidget {
  const StudioFooter(
      {Key key, @required this.indexVN, @required this.studioEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.start,
        // CHILDREN
        children: <Widget>[
          // COPYRIGHT
          StudioFooterCopyright(),

          // GAP
          const SizedBox(width: Design.SPACE),

          // TERMS
          StudioFooterTerms(indexVN: indexVN, studioEnabledVN: studioEnabledVN),

          P(text: 'Browser: ' + Browsers.BROWSER_AGENT.toString()),
          P(text: 'Mobile: ' + Browsers.MOBILE.toString())
        ]);
  }
}
