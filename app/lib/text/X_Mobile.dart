import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:flutter/material.dart';

// X to close something
class X_Mobile extends StatelessWidget {
  const X_Mobile({Key key, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final EdgeInsetsGeometry padding;
  final Color color;

  // size of X
  static const double xEdge = Design.SPACE * 2;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        child: Images.of(
          Design.ICON_CROSS,
          width: xEdge,
          height: xEdge,
          color: color,
        ));
  }
}
