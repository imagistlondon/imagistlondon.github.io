import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:flutter/material.dart';

class StudioOffsetBackground extends StatelessWidget {
  const StudioOffsetBackground({Key key, @required this.studioEnabledVN})
      : super(key: key);

  // enabled flag (showing)
  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L1(
      studioEnabledVN,
      // ANIMATE (OPACITY)
      (studioEnabled) => AnimatedOpacity(
        // DURATION
        duration: Design.STUDIO_SLIDE_ANIMATION_DURATION,
        // CURVE
        curve: Design.STUDIO_SLIDE_ANIMATION_CURVE,
        // OPACITY
        opacity: studioEnabled ? 1 : 0,
        // CHILD
        child: Container(
            height: studioEnabled ? MediaQuery.of(context).size.height : 0,
            color: Design.STUDIO_OFFSET_COLOR),
      ),
    );
  }
}
