import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/showcaseX34/ShowcaseImageX34.dart';
import 'package:app/widget/showcaseX34/ShowcaseMenuX34.dart';
import 'package:flutter/material.dart';

class ShowcaseX34 extends StatefulWidget {
  const ShowcaseX34(
      {Key key, @required this.indexVN, @required this.studyEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;

  @override
  ShowcaseX34State createState() => ShowcaseX34State();
}

class ShowcaseX34State extends State<ShowcaseX34> {
  // project enabled
  final ValueNotifier<Project> projectEnabledVN = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    // row
    final Row row = Row(children: <Widget>[
      // MENU
      ShowcaseMenuX34(
          indexVN: widget.indexVN,
          studyEnabledVN: widget.studyEnabledVN,
          projectEnabledVN: projectEnabledVN),

      // IMAGE
      ShowcaseImageX34(
          indexVN: widget.indexVN,
          studyEnabledVN: widget.studyEnabledVN,
          projectEnabledVN: projectEnabledVN)
    ]);

    // LISTEN
    return L1C(
        widget.indexVN,
        (index, child) =>
            Visibility(visible: index == Index.WORK_SHOWCASE, child: child),
        child: row);
  }
}
