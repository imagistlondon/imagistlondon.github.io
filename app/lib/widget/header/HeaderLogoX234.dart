import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/header/HeaderLogoX1.dart';
import 'package:flutter/material.dart';

class HeaderLogoX234 extends StatelessWidget {
  const HeaderLogoX234(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.start,
        // CHILDREN
        children: <Widget>[
          // HeaderLogo
          HeaderLogoX1(indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
        ]);
  }
}
