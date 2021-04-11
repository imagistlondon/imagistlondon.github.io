import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

// X to close something
class X_Default extends StatefulWidget {
  const X_Default(
      {Key key, this.onTap, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  X_DefaultState createState() => X_DefaultState();
}

class X_DefaultState extends State<X_Default> with TickerProviderStateMixin {
  // size of X
  static const double xEdge = Design.SPACE * 2;

  // animation rotaion
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // animation controller
    controller = AnimationController(
      duration: Design.ICON_CROSS_ANIMATION_DURATION,
      vsync: this,
    );

    // 90 degree turn
    animation = Tween<double>(begin: 0, end: -90 / 360).animate(controller);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onEnter(PointerEvent pe) {
    controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    // UA
    return UA(
        onEnter: onEnter,
        // PADDED CONTAINER
        child: Container(
            padding: widget.padding,
            // ROTATION TRANSITION
            child: RotationTransition(
                turns: animation,
                // IMAGE
                child: Images.of(
                  Design.ICON_CROSS,
                  width: xEdge,
                  height: xEdge,
                  color: widget.color,
                ))));
  }
}
