import 'package:app/config/Design.dart';
import 'package:app/util/X_Default.dart';
import 'package:app/util/X_Mobile.dart';
import 'package:app/util/Browsers.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

// X to close something
class X extends StatelessWidget {
  const X({Key key, this.onTap, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final GestureTapCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // UA
    return UA(
        onTap: onTap,
        child: Browsers.MOBILE
            ? X_Mobile(padding: padding, color: color)
            : X_Default(padding: padding, color: color));
  }
}
