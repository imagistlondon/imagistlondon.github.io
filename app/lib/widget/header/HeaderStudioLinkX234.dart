import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1C.dart';
import 'package:app/widget/header/HeaderStudioLinkX1.dart';
import 'package:flutter/material.dart';

class HeaderStudioLinkX234 extends StatelessWidget {
  const HeaderStudioLinkX234(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;
  final ValueNotifier<bool> studioEnabledVN;

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
              (bulletsEnabled, child) =>
                  // ANIMATE WHITE BACKGROUND (WITH SLOW IN AND OUT) TO HIDE BULLETS
                  AnimatedContainer(
                      // DURATION
                      duration: Design.HEADER_WORK_SLIDE_ANIMATION_DURATION,
                      // CURVE
                      curve: bulletsEnabled
                          ? Curves.easeInQuint
                          : Curves.easeOutQuint,
                      // COLOR
                      color: bulletsEnabled
                          ? Design.BACKGROUND_COLOR.withOpacity(0)
                          : Design.BACKGROUND_COLOR,
                      child: child),
              // CHILD
              child: Container(
                  // PADDING
                  padding: EdgeInsets.only(
                      right: Design.gap(context) - Design.SPACE),
                  // HeaderStudioLink
                  child: HeaderStudioLinkX1(
                      contentVN: contentVN, studioEnabledVN: studioEnabledVN)))
        ]);
  }
}
