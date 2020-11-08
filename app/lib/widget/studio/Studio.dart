import 'package:app/widget/studio/StudioBox.dart';
import 'package:app/widget/studio/StudioOffsetBackground.dart';
import 'package:flutter/material.dart';

class Studio extends StatelessWidget {
  const Studio({Key key, @required this.studioEnabledVN}) : super(key: key);

  // enabled flag (showing)
  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    // STACK
    return Stack(children: <Widget>[
      // OFFSET AREA
      StudioOffsetBackground(studioEnabledVN: studioEnabledVN),
      // BOX AREA
      StudioBox(studioEnabledVN: studioEnabledVN)
    ]);
  }
}
