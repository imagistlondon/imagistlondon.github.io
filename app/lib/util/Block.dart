import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  const Block({
    Key key,
    this.gap = false,
    this.widthFactor = 1,
    this.minWidth,
    this.maxWidth,
    this.color,
    this.child,
  }) : super(key: key);

  final bool gap;
  final double widthFactor;
  final double minWidth;
  final double maxWidth;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // calculate available section width
    final sectionWidth =
        gap ? Design.sectionInnerWidth(context) : Design.sectionWidth(context);

    // calalculate width
    double width = sectionWidth * widthFactor;

    // limit width
    if (minWidth != null && width < minWidth) width = minWidth;
    if (maxWidth != null && width > maxWidth) width = maxWidth;

    // CONTAINER
    return Container(width: width, child: child, color: color);
  }
}
