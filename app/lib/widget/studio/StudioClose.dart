import 'package:app/config/Design.dart';
import 'package:app/text/X.dart';
import 'package:flutter/material.dart';

class StudioClose extends StatelessWidget {
  const StudioClose({Key key, @required this.studioEnabledVN})
      : super(key: key);

  // enabled flag (showing)
  final ValueNotifier<bool> studioEnabledVN;

  void onTap() {
    studioEnabledVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.end,
        // CHILDREN
        children: <Widget>[
          X(
            // TAP
            onTap: onTap,
            // PADDING
            padding: EdgeInsets.symmetric(
                horizontal: Design.gap(context),
                vertical: Design.gap(context) - Design.SPACE),
            // COLOR
            color: Design.STUDIO_X_COLOR,
          )
        ]);
  }
}
