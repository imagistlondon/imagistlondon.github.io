import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HeaderLink extends StatefulWidget {
  const HeaderLink(
      {Key key, this.onTap, this.text = 'Text', this.faded = false})
      : super(key: key);

  final GestureTapCallback onTap;
  final String text;
  final bool faded;

  @override
  HeaderLinkState createState() => HeaderLinkState();
}

class HeaderLinkState extends State<HeaderLink> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

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
        onTap: widget.onTap,
        onEnter: onEnter,
        onExit: onExit,
        // CONTAINER
        child: Container(
            // CENTERED
            alignment: Alignment.center,
            // PADDING
            padding: const EdgeInsets.symmetric(horizontal: Design.SPACE),
            // HEIGHT
            height: Design.headerLinkHeight(context),
            // LISTEN
            child: L1C(
                hoverVN,
                // ANIMATE (UNDERLINE)
                (hover, child) => AnimatedContainer(
                    // DURATION
                    duration: Design.HEADER_LINK_UNDERLINE_ANIMATION_DURATION,

                    // CURVE
                    curve: Design.HEADER_LINK_UNDERLINE_ANIMATION_CURVE,

                    // DECORATION (UNDERLINE)
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Design.HEADER_LINK_UNDERLINE_COLOR
                                    // OPACITY CHANGE (ANIMATED)
                                    .withOpacity(hover
                                        ? Design
                                            .HEADER_LINK_UNDERLINE_COLOR.opacity
                                        : 0.0)))),
                    child: child),
                // TEXT
                child: P(
                    text: widget.text,
                    // STYLE
                    style: TextStyle(
                        color: widget.faded
                            ? Design.HEADER_LINK_FADE_COLOR
                            : Design.HEADER_LINK_COLOR)))));
  }
}
