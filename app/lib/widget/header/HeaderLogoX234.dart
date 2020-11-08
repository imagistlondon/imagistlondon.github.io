import 'package:app/Index.dart';
import 'package:app/widget/header/HeaderLogo.dart';
import 'package:flutter/material.dart';

class HeaderLogoX234 extends StatelessWidget {
  const HeaderLogoX234(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
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
          HeaderLogo(indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
        ]);
  }
}
