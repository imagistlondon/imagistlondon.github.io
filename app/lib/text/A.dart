import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/UA.dart';
import 'package:app/util/URL.dart';
import 'package:flutter/material.dart';

// <a>
class A extends StatefulWidget {
  const A(
      {Key key,
      this.url,
      this.onTap,
      this.child,
      this.email = false,
      this.phone = false,
      this.lineDuration = const Duration(milliseconds: 100),
      this.lineCurve = Curves.linear,
      this.lineColor = Design.COLOR})
      : super(key: key);

  final String url;
  final Function onTap;
  final Widget child;
  final bool email;
  final bool phone;
  final Duration lineDuration;
  final Curve lineCurve;
  final Color lineColor;

  @override
  _AState createState() => _AState();
}

class _AState extends State<A> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  void onTap() async {
    if (widget.onTap != null) {
      widget.onTap();
    }
    if (widget.url != null) {
      widget.email
          ? URL.openEmail(widget.url)
          : widget.phone
              ? URL.openPhone(widget.url)
              : URL.open(widget.url);
    }
  }

  void onEnter(PointerEvent pe) {
    hoverVN.value = true;
  }

  void onExit(PointerEvent pe) {
    hoverVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // UA
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // LISTEN
        child: L1(
            hoverVN,
            // ANIMATED CONTAINER
            (hover) => AnimatedContainer(
                duration: widget.lineDuration,
                curve: widget.lineCurve,
                // DECORATION
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.0,
                            color: widget.lineColor.withOpacity(
                                hover ? widget.lineColor.opacity : 0.0)))),
                child: widget.child)));
  }
}
