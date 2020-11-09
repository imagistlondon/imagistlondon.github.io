import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L2.dart';
import 'package:app/util/L3.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class ShowcaseLinkX34 extends StatefulWidget {
  const ShowcaseLinkX34(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN,
      @required this.menuEnabledVN,
      @required this.menuFinishedVN,
      @required this.project})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;
  final ValueNotifier<bool> menuEnabledVN;
  final ValueNotifier<bool> menuFinishedVN;
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

  // matrixA
  static final Matrix4 matrixA = Matrix4Transform().translate(x: 0).matrix4;

  // matrixB
  static final Matrix4 matrixB = Matrix4Transform()
      .translate(x: Design.SHOWCASE_MENU_LINK_TRANSLATION_ANIMATION_DISTANCE)
      .matrix4;

  //

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
                    Design.SHOWCASE_MENU_LINK_OPACITY_RIGHT_ANIMATION_DURATION,
                animationOpacityCurve:
                    Design.SHOWCASE_MENU_LINK_OPACITY_RIGHT_ANIMATION_CURVE,
                animationOpacityMin:
                    Design.SHOWCASE_MENU_LINK_OPACITY_ANIMATION_MIN,
              );
            })

            //     L3(widget.menuEnabledVN, widget.menuFinishedVN, linkEnabledVN,
            //         (menuEnabled, menuFinished, linkEnabled) {
            //   return AnimatedContainer(
            //       // DURATION
            //       duration:
            //           Design.SHOWCASE_MENU_LINK_TRANSLATION_ANIMATION_DURATION,
            //       // CURVE
            //       curve: Design.SHOWCASE_MENU_LINK_TRANSLATION_ANIMATION_CURVE,
            //       // TRANSFORM
            //       transform: linkEnabled ? matrixB : matrixA,
            //       // CHILD
            //       child: menuEnabled && !menuFinished && !linkEnabled
            //           ? H1(
            //               text: widget.project.title,
            //               animateOpacity: true,
            //               animationOpacityDown: true,
            //               animationOpacityDuration: Design
            //                   .SHOWCASE_MENU_LINK_OPACITY_LEFT_ANIMATION_DURATION,
            //               animationOpacityCurve: Design
            //                   .SHOWCASE_MENU_LINK_OPACITY_LEFT_ANIMATION_CURVE,
            //               animationOpacityMin:
            //                   Design.SHOWCASE_MENU_LINK_OPACITY_ANIMATION_MIN,
            //             )
            //           : H1(
            //               text: widget.project.title,
            //               animateOpacity: true,
            //               animationOpacityDown: menuEnabled && !linkEnabled,
            //               animationOpacityDuration: Design
            //                   .SHOWCASE_MENU_LINK_OPACITY_RIGHT_ANIMATION_DURATION,
            //               animationOpacityCurve: Design
            //                   .SHOWCASE_MENU_LINK_OPACITY_RIGHT_ANIMATION_CURVE,
            //               animationOpacityMin:
            //                   Design.SHOWCASE_MENU_LINK_OPACITY_ANIMATION_MIN,
            //             ));
            // })

            ));
  }
}
