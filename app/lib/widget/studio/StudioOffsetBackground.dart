import 'dart:async';

import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:flutter/material.dart';

class StudioOffsetBackground extends StatefulWidget {
  const StudioOffsetBackground({Key key, @required this.studioEnabledVN})
      : super(key: key);

  // enabled flag (showing)
  final ValueNotifier<bool> studioEnabledVN;

  @override
  StudioOffsetBackgroundState createState() => StudioOffsetBackgroundState();
}

class StudioOffsetBackgroundState extends State<StudioOffsetBackground> {
  // if the studio slide animation has ended
  final ValueNotifier<bool> studioAnimationEndedVN = new ValueNotifier(true);

  // timer to reset height of offset backfround after close
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // calculate height
    final double height = MediaQuery.of(context).size.height;

    // LISTEN
    return L1(widget.studioEnabledVN, (studioEnabled) {
      // initiate height resetter timer
      if (!studioEnabled) {
        studioAnimationEndedVN.value = false;
        timer = Timer(Design.STUDIO_SLIDE_ANIMATION_DURATION, () {
          studioAnimationEndedVN.value = true;
        });
      }

      // ANIMATE (OPACITY)
      return AnimatedOpacity(
        // DURATION
        duration: Design.STUDIO_SLIDE_ANIMATION_DURATION,
        // CURVE
        curve: Design.STUDIO_SLIDE_ANIMATION_CURVE,
        // OPACITY
        opacity: studioEnabled ? 1 : 0,
        // CHILD (LISTEN TO ANIMATION END)
        child: L1(
            studioAnimationEndedVN,
            (studioAnimationEnded) => Container(
                height: !studioEnabled && studioAnimationEnded ? 0 : height,
                color: Design.STUDIO_OFFSET_COLOR)),
      );
    });
  }
}
