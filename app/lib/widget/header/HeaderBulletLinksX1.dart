import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1C.dart';
import 'package:app/widget/header/HeaderBulletLink.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class HeaderBulletLinksX1 extends StatelessWidget {
  const HeaderBulletLinksX1(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    // LISTEN (bulletsEnabledVN)
    return L1C(
        bulletsEnabledVN,
        // ANIMATED CONTAINER
        (bulletsEnabled, child) => AnimatedContainer(
            // HEIGHT
            height: !bulletsEnabled ? 0 : Design.SPACE * 8,
            // DURATION
            duration: Design.HEADER_X1_BULLETS_ANIMATION_DURATION,
            // CURVE
            curve: Design.HEADER_X1_BULLETS_ANIMATION_CURVE,
            child: child),
        // CHILD
        child: Container(
            padding: EdgeInsets.all(Design.gap(context) - Design.SPACE),
            child: Column(children: <Widget>[
              for (final Index index in Indexes.works())
                HeaderBulletLink(
                    index: index,
                    indexVN: indexVN,
                    bulletsEnabledVN: bulletsEnabledVN)
            ])));
  }
}
