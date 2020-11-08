import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/Project.dart';
import 'package:app/widget/showcaseX34/ShowcaseImageX34.dart';
import 'package:app/widget/showcaseX34/ShowcaseMenuX34.dart';
import 'package:flutter/material.dart';

class ShowcaseX34 extends StatefulWidget {
  const ShowcaseX34(
      {Key key, @required this.indexVN, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;

  @override
  ShowcaseX34State createState() => ShowcaseX34State();
}

class ShowcaseX34State extends State<ShowcaseX34> {
  // projects
  static final List<Project> projects =
      Content.PROJECTS.where((p) => p.showcase == true).toList();

  // project enabled
  final ValueNotifier<Project> projectEnabledVN = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L1(
        widget.indexVN,
        (index) => Visibility(
            visible: index == Index.WORK_SHOWCASE,
            child: Row(children: <Widget>[
              // MENU
              ShowcaseMenuX34(
                  indexVN: widget.indexVN,
                  studyEnabledVN: widget.studyEnabledVN,
                  projectEnabledVN: projectEnabledVN,
                  projects: projects),

              // IMAGE
              ShowcaseImageX34(
                  indexVN: widget.indexVN,
                  studyEnabledVN: widget.studyEnabledVN,
                  projectEnabledVN: projectEnabledVN)
            ])));
  }
}
