import 'package:app/util/Section.dart';
import 'package:flutter/material.dart';

class SectionRow extends StatelessWidget {
  const SectionRow(
      {Key key,
      this.gap: false,
      this.padding,
      this.color,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.children = const <Widget>[]})
      : super(key: key);

  final bool gap;
  final EdgeInsets padding;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // CONTAINER
    return Section(
        gap: gap,
        padding: padding,
        color: color,
        // ROW
        child: Row(
            // MAIN AXIS
            mainAxisAlignment: mainAxisAlignment,
            // CROSS ALIGN
            crossAxisAlignment: crossAxisAlignment,
            // CHILDREN
            children: children));
  }
}
