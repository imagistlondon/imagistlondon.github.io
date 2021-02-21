import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/logo/LogoImage.dart';
import 'package:flutter/material.dart';

class LogoX1 extends StatelessWidget {
  const LogoX1(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    return Container(
        // PADDING
        padding: EdgeInsets.symmetric(vertical: Design.gap(context)),
        // LOGO IMAGE
        child: Row(children: [
          LogoImage(indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
        ]));
  }
}
