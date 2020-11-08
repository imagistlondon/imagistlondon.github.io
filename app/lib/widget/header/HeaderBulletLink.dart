import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/HTML.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HeaderBulletLink extends StatelessWidget {
  const HeaderBulletLink(
      {Key key,
      @required this.index,
      @required this.indexVN,
      @required this.bulletsEnabledVN})
      : super(key: key);

  final Index index;
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  // the dividing space between the bullet and the text
  static const double divider = Design.SPACE * 0.3;

  // bullet size (width and height)
  static const double bulletSize = Design.SPACE * 0.45;

  // selected bullet
  static const BoxDecoration bulletBlack = BoxDecoration(
    color: Design.HEADER_BULLET_COLOR,
    shape: BoxShape.circle,
  );

  // unselected bullet
  static final BoxDecoration bulletWhite = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(Design.SPACE)),
      border: Border.all(width: 1.0, color: Design.HEADER_BULLET_COLOR));

  void onTap() {
    bulletsEnabledVN.value = true;
    indexVN.value = index;
  }

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    // TAP
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // CONTENT
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: Design.SPACE),
            height: Design.gap(context),
            // LISTEN (bulletsEnabledVN)
            child: L1(
                bulletsEnabledVN,
                // ANIMATE OPACITY
                (bulletsEnabled) => AnimatedOpacity(
                    duration: Design.HEADER_WORK_SLIDE_ANIMATION_DURATION,
                    opacity: bulletsEnabled ? 1 : 0,
                    // ROW (BULLET -> TEXT)
                    child: Row(children: <Widget>[
                      // LISTEN (indexVN)
                      L1(
                          indexVN,
                          // BULLET
                          (_index) => Container(
                              width: bulletSize,
                              height: bulletSize,
                              decoration: this.index == _index
                                  ? bulletBlack
                                  : bulletWhite)),

                      // SPACE
                      Container(width: divider),

                      // TEXT
                      P(text: index.workDisplay())
                    ])))));
  }
}
