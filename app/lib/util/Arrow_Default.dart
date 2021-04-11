import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class Arrow_Default extends StatefulWidget {
  const Arrow_Default({Key key, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final EdgeInsets padding;
  final Color color;

  @override
  Arrow_DefaultState createState() => Arrow_DefaultState();
}

class Arrow_DefaultState extends State<Arrow_Default> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  void onEnter(PointerEvent pe) {
    hoverVN.value = true;
  }

  void onExit(PointerEvent pe) {
    hoverVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // UA
    return UA(
        onEnter: onEnter,
        onExit: onExit,
        // PADDED CONTAINER
        child: Container(
            padding: widget.padding,
            // CLIP
            child: ClipRect(
                // LISTENER
                child: L1C(
                    hoverVN,
                    // ANIMATED ALIGN
                    (hover, child) => AnimatedAlign(
                        // DURATION
                        duration: Design.ICON_ARROW_ANIMATION_DURATION,
                        curve: Design.ICON_ARROW_ANIMATION_CURVE,
                        alignment: Alignment.topCenter,
                        widthFactor: 1.0,
                        heightFactor: hover
                            ? 1.0
                            : Design.ICON_ARROW_ANIMATION_HEIGHT_SCALE,
                        child: child),
                    // IMAGE
                    child: Images.of(Design.ICON_ARROW,
                        width: Design.ICON_ARROW_WIDTH,
                        color: widget.color)))));
  }
}
