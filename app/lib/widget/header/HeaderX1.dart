import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/header/HeaderBulletLinksX1.dart';
import 'package:app/widget/header/HeaderLogoX1.dart';
import 'package:app/widget/header/HeaderStudioLinkX1.dart';
import 'package:app/widget/header/HeaderWorkLinkX1.dart';
import 'package:flutter/material.dart';

class HeaderX1 extends StatelessWidget {
  const HeaderX1(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> studioEnabledVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    return Container(
        // COLUMN
        child: Column(children: <Widget>[
      // X1 MAIN HEADER ROW
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        // LOGO
        HeaderLogoX1(indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN),
        // LINKS
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // WORK
            HeaderWorkLinkX1(
                contentVN: contentVN,
                indexVN: indexVN,
                bulletsEnabledVN: bulletsEnabledVN),
            // STUDIO
            HeaderStudioLinkX1(
                contentVN: contentVN, studioEnabledVN: studioEnabledVN),
          ],
        ))
      ]),
    ]));
  }
}
