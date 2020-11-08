import 'package:app/util/HTML.dart';
import 'package:flutter/material.dart';

class UA extends StatelessWidget {
  const UA(
      {Key key, this.onTap, this.onEnter, this.onExit, @required this.child})
      : super(key: key);

  final GestureTapCallback onTap;
  final Function(PointerEvent pe) onEnter;
  final Function(PointerEvent pe) onExit;
  final Widget child;

  void _onEnter(PointerEvent pe) {
    HTML.pointer();
    if (this.onEnter != null) this.onEnter(pe);
  }

  void _onExit(PointerEvent pe) {
    HTML.cursor();
    if (this.onExit != null) this.onExit(pe);
  }

  @override
  Widget build(BuildContext context) {
    // TAP
    return GestureDetector(
        onTap: onTap,
        // MOUSE
        child: MouseRegion(
            onEnter: _onEnter,
            onExit: _onExit,
            // CHILD
            child: child));
  }
}
