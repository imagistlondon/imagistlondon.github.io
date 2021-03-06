import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/header/HeaderStudioLinkX1.dart';
import 'package:app/widget/header/HeaderWorkLinkX1.dart';
import 'package:flutter/material.dart';

class HeaderX1 extends StatelessWidget {
  const HeaderX1(
      {Key key,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> studioEnabledVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    return Container(
        // COLUMN
        child: Column(children: <Widget>[
      // X1 MAIN HEADER ROW
      Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        // LINKS
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // WORK
            HeaderWorkLinkX1(
                indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN),
            // STUDIO
            HeaderStudioLinkX1(studioEnabledVN: studioEnabledVN),
          ],
        ))
      ]),
    ]));
  }
}
