import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/Project.dart';
import 'package:app/widget/study/StudyArrow.dart';
import 'package:app/widget/study/StudyClose.dart';
import 'package:app/widget/study/StudyContent.dart';
import 'package:flutter/material.dart';

class Study extends StatefulWidget {
  const Study({Key key, @required this.indexVN, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;

  @override
  StudyState createState() => StudyState();
}

class StudyState extends State<Study> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // L1
    return L1(
        widget.studyEnabledVN,
        // VISIBLE
        (studyEnabled) => Visibility(
            visible: studyEnabled != null,
            // CONTAINER
            child: studyEnabled == null
                ? Container(child: H1(text: 'No Project Selected'))
                : Container(
                    color: Design.BACKGROUND_COLOR,
                    width: width,
                    height: height,
                    child: Stack(children: <Widget>[
                      // content
                      StudyContent(
                          indexVN: widget.indexVN,
                          studyEnabledVN: widget.studyEnabledVN,
                          scrollController: scrollController),

                      // X
                      StudyClose(
                          indexVN: widget.indexVN,
                          studyEnabledVN: widget.studyEnabledVN),

                      // ARROW
                      StudyArrow(
                          indexVN: widget.indexVN,
                          studyEnabledVN: widget.studyEnabledVN,
                          scrollController: scrollController)
                    ]))));
  }
}
