import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1C.dart';
import 'package:app/widget/studio/StudioClose.dart';
import 'package:app/widget/studio/StudioContent.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class StudioBox extends StatelessWidget {
  const StudioBox(
      {Key key, @required this.indexVN, @required this.studioEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;

  // enabled flag (showing)
  final ValueNotifier<bool> studioEnabledVN;

  // matrixA
  static final Matrix4 matrixA = Matrix4Transform().translate(x: 0).matrix4;

  @override
  Widget build(BuildContext context) {
    // calculate width
    final double width = Break.x1(context)
        ? MediaQuery.of(context).size.width - Design.gap(context)
        : Design.STUDIO_SIZE;

    // matrixB
    final Matrix4 matrixB = Matrix4Transform().translate(x: width).matrix4;

    // LISTEN
    return L1C(
        studioEnabledVN,
        // ANIMATE (TRANSLATION)
        (studioEnabled, child) => AnimatedContainer(
            // DURATION
            duration: Design.STUDIO_SLIDE_ANIMATION_DURATION,
            // CURVE
            curve: Design.STUDIO_SLIDE_ANIMATION_CURVE,
            // TRANSFORM
            transform: studioEnabled ? matrixA : matrixB,
            // CHILD
            child: child),

        // ROW
        child: Row(
            // ALIGNMENT
            mainAxisAlignment: MainAxisAlignment.end,
            // CHILDREN
            children: <Widget>[
              Container(
                  // WIDTH
                  width: width,
                  // HEIGHT
                  height: MediaQuery.of(context).size.height,
                  // COLOR
                  color: Design.STUDIO_BACKGROUND_COLOR,
                  // STACK
                  child: Stack(children: <Widget>[
                    // CONTENT
                    StudioContent(
                        indexVN: indexVN, studioEnabledVN: studioEnabledVN),
                    // CLOSE (X)
                    StudioClose(studioEnabledVN: studioEnabledVN),
                  ]))
            ]));
  }
}
