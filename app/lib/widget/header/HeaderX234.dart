import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/header/HeaderBulletLinksX234.dart';
import 'package:app/widget/header/HeaderStudioLinkX234.dart';
import 'package:app/widget/header/HeaderWorkLinkX234.dart';
import 'package:flutter/material.dart';

class HeaderX234 extends StatelessWidget {
  const HeaderX234(
      {Key key,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;
  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    return Container(
      // PADDING
      padding:
          EdgeInsets.symmetric(vertical: Design.gap(context) - Design.SPACE),
      // STACK
      child: Stack(
        children: <Widget>[
          // HEADER WORK LINK
          HeaderWorkLinkX234(
              indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN),

          // HEADER BULLET LINKS
          HeaderBulletLinksX234(
              indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN),

          // HEADER STUDIO LINK
          HeaderStudioLinkX234(
              indexVN: indexVN,
              bulletsEnabledVN: bulletsEnabledVN,
              studioEnabledVN: studioEnabledVN)
        ],
      ),
    );
  }
}
