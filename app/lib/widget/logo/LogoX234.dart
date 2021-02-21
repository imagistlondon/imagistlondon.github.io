import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/logo/LogoImage.dart';
import 'package:flutter/material.dart';

class LogoX234 extends StatelessWidget {
  const LogoX234(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    return Container(
        // PADDING
        padding:
            EdgeInsets.symmetric(vertical: Design.gap(context) - Design.SPACE),
        // LOGO IMAGE
        child: Row(children: [
          LogoImage(indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
        ]));
  }
}
