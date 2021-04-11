import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:flutter/material.dart';

class Arrow_Mobile extends StatelessWidget {
  const Arrow_Mobile({Key key, this.padding, this.color = Design.COLOR})
      : super(key: key);

  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // PADDED CONTAINER
    return Container(
        padding: padding,
        // IMAGE
        child: Images.of(Design.ICON_ARROW,
            width: Design.ICON_ARROW_WIDTH, color: color));
  }
}
