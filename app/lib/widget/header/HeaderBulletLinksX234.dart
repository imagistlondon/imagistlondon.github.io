import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1C.dart';
import 'package:app/widget/header/HeaderBulletLink.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class HeaderBulletLinksX234 extends StatelessWidget {
  const HeaderBulletLinksX234(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  // matrixA
  static final Matrix4 matrixA = Matrix4Transform()
      .translate(
          x: Design.HEADER_BULLETS_WIDTH - Design.HEADER_STUDIO_LINK_WIDTH)
      .matrix4;

  // matrixB
  static final Matrix4 matrixB = Matrix4Transform()
      .translate(
          x: Design.HEADER_BULLETS_WIDTH -
              Design.HEADER_STUDIO_LINK_WIDTH -
              Design.HEADER_BULLETS_WIDTH)
      .matrix4;

  @override
  Widget build(BuildContext context) {
    // LISTEN (bulletsEnabledVN)
    return L1C(
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
                child: child),
        // CHILD
        child: Container(
            // PADDING
            padding: EdgeInsets.only(right: Design.gap(context) - Design.SPACE),
            // ROW
            child: Row(
                // ALIGNMENT
                mainAxisAlignment: MainAxisAlignment.end,
                // CHILDREN
                children: <Widget>[
                  // BULLETS (SHOWCASE / ARCHIVE / TAGS)
                  for (final Index index in Indexes.works())
                    HeaderBulletLink(
                        index: index,
                        indexVN: indexVN,
                        bulletsEnabledVN: bulletsEnabledVN)
                ])));
  }
}
