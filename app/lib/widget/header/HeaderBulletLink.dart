import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/L2.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HeaderBulletLink extends StatefulWidget {
  const HeaderBulletLink(
      {Key key,
      @required this.index,
      @required this.indexVN,
      @required this.bulletsEnabledVN})
      : super(key: key);

  final Index index;
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  HeaderBulletLinkState createState() => HeaderBulletLinkState();
}

class HeaderBulletLinkState extends State<HeaderBulletLink> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  // the dividing space between the bullet and the text
  static const double divider = Design.SPACE * 0.3;

  // bullet size (width and height)
  static const double bulletSize = Design.SPACE * 0.45;
  static const double bulletSizeInner = bulletSize * 0.5;

  // selected bullet
  static const BoxDecoration bulletBlack = BoxDecoration(
    color: Design.HEADER_BULLET_COLOR,
    shape: BoxShape.circle,
  );

  // unselected bullet
  static final BoxDecoration bulletWhite = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(Design.SPACE)),
      border: Border.all(width: 1.0, color: Design.HEADER_BULLET_COLOR));

  // hover inner bullet
  static final Container bulletBlackInner = Container(
      width: bulletSizeInner,
      height: bulletSizeInner,
      decoration: const BoxDecoration(
        color: Design.HEADER_BULLET_COLOR,
        shape: BoxShape.circle,
      ));

  void onTap() {
    widget.bulletsEnabledVN.value = true;
    widget.indexVN.value = widget.index;
  }

  void onEnter(PointerEvent pe) {
    hoverVN.value = true;
  }

  void onExit(PointerEvent pe) {
    hoverVN.value = false;
  }

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
                widget.bulletsEnabledVN,
                // ANIMATE OPACITY
                (bulletsEnabled) => AnimatedOpacity(
                    duration: Design.HEADER_WORK_SLIDE_ANIMATION_DURATION,
                    opacity: bulletsEnabled ? 1 : 0,
                    // ROW (BULLET -> TEXT)
                    child: Row(children: <Widget>[
                      // STACK (BULLETS)
                      Stack(children: <Widget>[
                        // MAIN BULLET
                        L1(
                          widget.indexVN,
                          (_index) => Container(
                              width: bulletSize,
                              height: bulletSize,
                              decoration: widget.index == _index
                                  ? bulletBlack
                                  : bulletWhite),
                        ),
                        // HOVER INNER BULLET
                        Container(
                            width: bulletSize,
                            height: bulletSize,
                            child: Align(
                                child: L1(
                                    hoverVN,
                                    (hover) => hover
                                        ? bulletBlackInner
                                        : const SizedBox.shrink())))
                      ]),

                      // SPACE
                      Container(width: divider),

                      // TEXT
                      P(text: widget.index.workDisplay())
                    ])))));
  }
}
