import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/widget/header/HeaderBulletLinksX1.dart';
import 'package:app/widget/header/HeaderLogo.dart';
import 'package:app/widget/header/HeaderStudioLink.dart';
import 'package:app/widget/header/HeaderWorkLink.dart';
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
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<bool> studioEnabledVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    return Container(
        // PADDING
        padding:
            EdgeInsets.symmetric(vertical: Design.gap(context) - Design.SPACE),

        // COLUMN
        child: Column(children: <Widget>[
          // X1 MAIN HEADER ROW
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // LOGO
                HeaderLogo(
                    indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // WORK
                    HeaderWorkLink(
                        contentVN: contentVN,
                        indexVN: indexVN,
                        bulletsEnabledVN: bulletsEnabledVN),
                    // STUDIO
                    HeaderStudioLink(
                        contentVN: contentVN, studioEnabledVN: studioEnabledVN),
                  ],
                ))
              ]),

          // X1 WORK BULLETS
          HeaderBulletLinksX1(
              indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
        ]));
  }
}
