import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section(
      {Key key, this.gap: false, this.padding, this.color, this.child})
      : super(key: key);

  final bool gap;
  final EdgeInsets padding;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.center,
        // CHILDREN
        children: <Widget>[
          // CONTAINER
          Container(
            width: this.gap
                // WIDTH GAP
                ? Design.sectionInnerWidth(context)
                // NO GAP
                : Design.sectionWidth(context),
            // PADDING
            padding: padding,
            // COLOR
            color: color,
            // CHILD
            child: child,
          ),
        ]);
  }
}
