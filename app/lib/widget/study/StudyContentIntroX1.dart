import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentIntroX1 extends StatelessWidget {
  const StudyContentIntroX1(
      {Key key, @required this.studyEnabledVN, @required this.project})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final Project project;

  @override
  Widget build(BuildContext context) {
    // CONTAINER
    return Container(
        // PADDING
        padding: EdgeInsets.all(Design.gap(context)),
        // ROW
        child: Column(
            // CROSS ALIGNMENT START
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              H1(
                  text: project.title,
                  selectable: true,
                  style:
                      TextStyle(color: Design.STUDY_CONTENT_INTRO_TITLE_COLOR)),
              // subtitle
              H1(
                  text: project.subtitle,
                  selectable: true,
                  style: TextStyle(
                      color: Design.STUDY_CONTENT_INTRO_SUBTITLE_COLOR)),
              // gap
              const SizedBox(height: Design.SPACE),
              // description
              P(text: project.desc, selectable: true),
            ]));
  }
}
