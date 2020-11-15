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
        // SCROLLABLE
        child: SingleChildScrollView(
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
              ])),
          // VERTICAL SPACING
          clearance
        ])));
  }
}
