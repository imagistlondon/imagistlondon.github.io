import 'package:app/config/Design.dart';
import 'package:app/util/Arrow_Mobile.dart';
import 'package:app/util/Arrow_Default.dart';
import 'package:app/util/Browsers.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  const Arrow({Key key, this.onTap, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final GestureTapCallback onTap;
  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // COLUMN
    return Align(
        alignment: Alignment.bottomRight,
        child: UA(
            onTap: onTap,
            child: Browsers.MOBILE
                ? Arrow_Mobile(padding: padding, color: color)
                : Arrow_Default(padding: padding, color: color)));
  }
}
