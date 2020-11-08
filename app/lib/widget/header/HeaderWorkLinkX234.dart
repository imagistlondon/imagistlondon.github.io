import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1C.dart';
import 'package:app/widget/header/HeaderWorkLink.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class HeaderWorkLinkX234 extends StatelessWidget {
  const HeaderWorkLinkX234(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  // matrixA
  static final Matrix4 matrixA = Matrix4Transform()
      .translate(x: 0 - Design.HEADER_STUDIO_LINK_WIDTH)
      .matrix4;

  // matrixB
  static final Matrix4 matrixB = Matrix4Transform()
      .translate(
          x: 0 - Design.HEADER_STUDIO_LINK_WIDTH - Design.HEADER_BULLETS_WIDTH)
      .matrix4;

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.end,
        // CHILDREN
        children: <Widget>[
          // LISTEN (bulletsEnabledVN)
          L1C(
              bulletsEnabledVN,
              // BUILDER
              (bulletsEnabled, child) =>
                  // ANIMATED CONTAINER
                  AnimatedContainer(
                      // DURATION
                      duration: Design.HEADER_WORK_SLIDE_ANIMATION_DURATION,
                      // CURVE
                      curve: Design.HEADER_WORK_SLIDE_ANIMATION_CURVE,
                      // TRANSFORM
                      transform: bulletsEnabled ? matrixB : matrixA,
                      // CHILD
                      child: child),
              // CHILD (WORK)
              child: Container(
                  // PADDING
                  padding: EdgeInsets.only(
                      right: Design.gap(context) - Design.SPACE),
                  // HeaderWorkLink
                  child: HeaderWorkLink(
                      indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)))
        ]);
  }
}
