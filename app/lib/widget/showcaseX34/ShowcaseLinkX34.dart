import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L2.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ShowcaseLinkX34 extends StatefulWidget {
  const ShowcaseLinkX34(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN,
      @required this.menuEnabledVN,
      @required this.project})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;
  final ValueNotifier<bool> menuEnabledVN;
  final Project project;

  @override
  ShowcaseLinkX34State createState() => ShowcaseLinkX34State();
}

class ShowcaseLinkX34State extends State<ShowcaseLinkX34> {
  // linkEnabledVN
  final ValueNotifier<bool> linkEnabledVN = ValueNotifier(false);

  // padding
  static const EdgeInsetsGeometry PADDING = EdgeInsets.only(
      left: Design.SPACE * 9, top: Design.SPACE / 2, bottom: Design.SPACE / 2);

  void onTap() {
    widget.studyEnabledVN.value = widget.project;
  }

  void onEnter(PointerEvent pe) {
    linkEnabledVN.value = true;
    widget.projectEnabledVN.value = widget.project;
  }

  void onExit(PointerEvent pe) {
    linkEnabledVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        child: Container(
            // WIDTH
            width: double.infinity,
            // PADDING
            padding: PADDING,
            // LISTEN (linkEnabledVN)
            child: L2(widget.menuEnabledVN, linkEnabledVN,
                (menuEnabled, linkEnabled) {
              return H1(
                text: widget.project.title,
                animateOpacity: true,
                animationOpacityDown: menuEnabled && !linkEnabled,
                animationOpacityDuration:
                    Design.SHOWCASE_MENU_LINK_OPACITY_ANIMATION_DURATION,
                animationOpacityCurve:
                    Design.SHOWCASE_MENU_LINK_OPACITY_ANIMATION_CURVE,
                animationOpacityMin:
                    Design.SHOWCASE_MENU_LINK_OPACITY_ANIMATION_MIN,
              );
            })));
  }
}
