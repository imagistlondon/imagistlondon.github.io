import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1C.dart';
import 'package:app/widget/header/HeaderBulletLink.dart';
import 'package:flutter/material.dart';

class HeaderBulletLinksX1 extends StatelessWidget {
  const HeaderBulletLinksX1(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    // LISTEN (bulletsEnabledVN)
    return L1C(
        bulletsEnabledVN,
        // ANIMATED CONTAINER
        (bulletsEnabled, child) => AnimatedOpacity(
            // HEIGHT
            opacity: !bulletsEnabled ? 0 : 1,
            // DURATION
            duration: Design.HEADER_X1_BULLETS_ANIMATION_DURATION,
            // CURVE
            curve: Design.HEADER_X1_BULLETS_ANIMATION_CURVE,
            child: child),
        // CHILD
        child: Container(
            // padding
            padding: EdgeInsets.all(Design.GAP_X1),
            // child
            child: Column(children: <Widget>[
              for (final Index index in Indexes.works())
                HeaderBulletLink(
                    index: index,
                    indexVN: indexVN,
                    bulletsEnabledVN: bulletsEnabledVN)
            ])));
  }
}
