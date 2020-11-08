import 'package:app/config/Design.dart';
import 'package:app/widget/studio/StudioFooterCopyright.dart';
import 'package:app/widget/studio/StudioFooterTerms.dart';
import 'package:flutter/material.dart';

class StudioFooter extends StatelessWidget {
  const StudioFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.start,
        // CHILDREN
        children: const <Widget>[
          // COPYRIGHT
          const StudioFooterCopyright(),

          // GAP
          const SizedBox(width: Design.SPACE),

          // TERMS
          const StudioFooterTerms(),
        ]);
  }
}
