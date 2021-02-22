import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/Block.dart';
import 'package:app/util/SectionRow.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentIntroX234 extends StatelessWidget {
  const StudyContentIntroX234(
      {Key key, @required this.studyEnabledVN, @required this.project})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final Project project;

  @override
  Widget build(BuildContext context) {
    // SECTION ROW
    return SectionRow(
        // GAP
        gap: true,
        // VERTICAL PADDING
        padding: EdgeInsets.symmetric(vertical: Design.gap(context)),
        // MAIN AXIS ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.center,
        // CROSS ALIGN STOP
        crossAxisAlignment: CrossAxisAlignment.start,
        // CHILDREN
        children: <Widget>[
          // title + subtitle
          Block(
              widthFactor: Design.STUDY_CONTENT_INTRO_BLOCK_WIDTH_FACTOR,
              minWidth: Design.STUDY_CONTENT_INTRO_BLOCK_MIN_WIDTH,
              maxWidth: Design.STUDY_CONTENT_INTRO_BLOCK_MAX_WIDTH,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // title
                    H1(
                        text: project.title,
                        selectable: true,
                        style: TextStyle(
                            color: Design.STUDY_CONTENT_INTRO_TITLE_COLOR)),
                    // subtitle
                    H1(
                        text: project.subtitle,
                        selectable: true,
                        style: TextStyle(
                            color: Design.STUDY_CONTENT_INTRO_SUBTITLE_COLOR))
                  ])),

          // gap
          SizedBox(width: Design.SPACE),

          // description
          Block(
              widthFactor: Design.STUDY_CONTENT_INTRO_BLOCK_WIDTH_FACTOR,
              minWidth: Design.STUDY_CONTENT_INTRO_BLOCK_MIN_WIDTH,
              maxWidth: Design.STUDY_CONTENT_INTRO_BLOCK_MAX_WIDTH,
              child: P(text: project.desc, selectable: true)),
        ]);
  }
}
