import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1C.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/UA.dart';
import 'package:app/widget/showcaseX34/ShowcaseLinkX34.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class ShowcaseMenuX34 extends StatefulWidget {
  const ShowcaseMenuX34({
    Key key,
    @required this.indexVN,
    @required this.studyEnabledVN,
    @required this.projectEnabledVN,
    @required this.projects,
  }) : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;
  final List<Project> projects;

  @override
  ShowcaseMenuX34State createState() => ShowcaseMenuX34State();
}

class ShowcaseMenuX34State extends State<ShowcaseMenuX34> {
  // menuEnabledVN
  final ValueNotifier<bool> menuEnabledVN = ValueNotifier(false);

  // matrixA
  static final Matrix4 matrixA = Matrix4Transform().translate(x: 0).matrix4;

  // matrixB
  static final Matrix4 matrixB = Matrix4Transform()
      .translate(
          x: 0 - Design.SHOWCASE_MENU_LINK_TRANSLATION_ANIMATION_DISTANCE)
      .matrix4;

  void onEnter(PointerEvent pe) {
    menuEnabledVN.value = true;
  }

  void onExit(PointerEvent pe) {
    menuEnabledVN.value = false;
    widget.projectEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    // width
    final double width = MediaQuery.of(context).size.width / 2;

    // clearance
    final SizedBox clearance =
        SizedBox(height: Design.clearance(context, bulletsOpen: true));

    return Container(
        // 50% WIDTH
        width: width,
        // COLUMN
        child: Column(children: <Widget>[
          // VERTICAL SPACING
          clearance,
          // MENU BLOCK
          UA(
              onEnter: onEnter,
              onExit: onExit,
              child: Column(children: <Widget>[
                // PROJECT LINKS
                for (final Project project in widget.projects)
                  ShowcaseLinkX34(
                      indexVN: widget.indexVN,
                      studyEnabledVN: widget.studyEnabledVN,
                      projectEnabledVN: widget.projectEnabledVN,
                      menuEnabledVN: menuEnabledVN,
                      project: project)
              ]))
        ]));
  }
}
