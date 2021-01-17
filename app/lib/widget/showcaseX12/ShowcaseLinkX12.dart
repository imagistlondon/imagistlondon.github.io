import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ShowcaseLinkX12 extends StatefulWidget {
  const ShowcaseLinkX12(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.project})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final Project project;

  @override
  ShowcaseLinkX12State createState() => ShowcaseLinkX12State();
}

class ShowcaseLinkX12State extends State<ShowcaseLinkX12> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  void onTap() {
    widget.studyEnabledVN.value = widget.project;
  }

  void onEnter(PointerEvent pe) {
    hoverVN.value = true;
  }

  void onExit(PointerEvent pe) {
    hoverVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // padding
    final EdgeInsetsGeometry padding = EdgeInsets.only(
        left: Design.gap(context),
        top: Design.gap(context) - Design.SPACE,
        right: Design.gap(context),
        bottom: Design.gap(context));

    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // CONTAINER
        child: Container(
            // PADDING
            padding: padding,
            // LISTEN
            child: L1(
                hoverVN,
                // ANIMATED CONTAINER
                (hover) => AnimatedContainer(

                    // DURATION
                    duration:
                        Design.SHOWCASE_X12_LINK_UNDERLINE_ANIMATION_DURATION,

                    // CURVE
                    curve: Design.SHOWCASE_X12_LINK_UNDERLINE_ANIMATION_CURVE,

                    // DECORATION (UNDERLINE)
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Design.SHOWCASE_X12_LINK_UNDERLINE_COLOR
                                    // OPACITY DECIDER (ANIMATED)
                                    .withOpacity(hover
                                        ? Design
                                            .SHOWCASE_X12_LINK_UNDERLINE_COLOR
                                            .opacity
                                        : 0.0)))),
                    // TEXT
                    child: H1(text: widget.project.title)))));
  }
}
