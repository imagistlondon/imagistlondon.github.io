import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/studio/StudioFooterCopyright.dart';
import 'package:app/widget/studio/StudioFooterTerms.dart';
import 'package:flutter/material.dart';

class StudioFooter extends StatelessWidget {
  const StudioFooter(
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
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.start,
        // CHILDREN
        children: <Widget>[
          // COPYRIGHT
          StudioFooterCopyright(contentVN: contentVN),

          // GAP
          const SizedBox(width: Design.SPACE),

          // TERMS
          StudioFooterTerms(
              contentVN: contentVN,
              indexVN: indexVN,
              studioEnabledVN: studioEnabledVN),
        ]);
  }
}
