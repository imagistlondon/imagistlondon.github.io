import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

import 'package:matrix4_transform/matrix4_transform.dart';

// X to close something
class X extends StatefulWidget {
  const X({Key key, this.onTap, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  _XState createState() => _XState();
}

class _XState extends State<X> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  // size of X
  static const double xEdge = Design.SPACE * 2;
  static const Size xSize = Size(xEdge, xEdge);

  // matrixA
  static final Matrix4 matrixA =
      Matrix4Transform().rotateByCenterDegrees(0, xSize).matrix4;

  // matrixB
  static final Matrix4 matrixB =
      Matrix4Transform().rotateByCenterDegrees(-90, xSize).matrix4;

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
        onTap: widget.onTap,
        onEnter: onEnter,
        onExit: onExit,
        // PADDED CONTAINER
        child: Container(
            padding: widget.padding,
            // LISTENER
            child: L1(
                hoverVN,
                // ANIMATED CONTAINER
                (hover) => AnimatedContainer(
                    duration: hover
                        ? Design.ICON_CROSS_ANIMATION_DURATION
                        : const Duration(milliseconds: 0),
                    // TRANSFORM
                    transform: hover ? matrixB : matrixA,
                    // IMAGE
                    child: Image(
                      image: const AssetImage(Design.ICON_CROSS),
                      height: xEdge,
                      color: widget.color,
                    )))));
  }
}
