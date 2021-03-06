import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:app/widget/showcaseX34/ShowcaseLinkX34.dart';
import 'package:flutter/material.dart';

class ShowcaseMenuX34 extends StatefulWidget {
  const ShowcaseMenuX34({
    Key key,
    @required this.indexVN,
    @required this.studyEnabledVN,
    @required this.projectEnabledVN,
  }) : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

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
    return Container(
        // 50% WIDTH
        width: MediaQuery.of(context).size.width / 2,

        // CENTER (vertically)
        child: Center(
            // MENU HOVER AREA
            child: UA(
                onEnter: onEnter,
                onExit: onExit,
                // SCROLLABLE
                child: ListView(
                    // vertical padding
                    padding: EdgeInsets.symmetric(
                        vertical: Design.clearance(context)),
                    // keep height wrapped to child height
                    shrinkWrap: true,
                    // items
                    children: <Widget>[
                      // PROJECT LINKS
                      for (final Project project
                          in Content.data.SHOWCASE_PROJECTS)
                        ShowcaseLinkX34(
                            indexVN: widget.indexVN,
                            studyEnabledVN: widget.studyEnabledVN,
                            projectEnabledVN: widget.projectEnabledVN,
                            menuEnabledVN: menuEnabledVN,
                            project: project),
                    ]))));
  }
}
