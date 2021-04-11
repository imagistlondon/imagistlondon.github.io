import 'package:app/config/Design.dart';
import 'package:app/util/Block.dart';
import 'package:app/util/SectionRow.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/study/StudyContentIntroDesc.dart';
import 'package:app/widget/study/StudyContentIntroSubtitle.dart';
import 'package:app/widget/study/StudyContentIntroTitle.dart';
import 'package:flutter/material.dart';

class StudyContentIntroX234 extends StatelessWidget {
  const StudyContentIntroX234(
      {Key key, @required this.studyEnabledVN, @required this.d_studyEnabledVN})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;

  static const SizedBox gap = const SizedBox(height: Design.SPACE);

  @override
  Widget build(BuildContext context) {
    print('StudyContentIntroX234.build');
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
                    StudyContentIntroTitle(
                        studyEnabledVN: studyEnabledVN,
                        d_studyEnabledVN: d_studyEnabledVN),
                    // subtitle
                    StudyContentIntroSubtitle(
                        studyEnabledVN: studyEnabledVN,
                        d_studyEnabledVN: d_studyEnabledVN),
                  ])),

          // gap
          gap,

          // description
          Block(
              widthFactor: Design.STUDY_CONTENT_INTRO_BLOCK_WIDTH_FACTOR,
              minWidth: Design.STUDY_CONTENT_INTRO_BLOCK_MIN_WIDTH,
              maxWidth: Design.STUDY_CONTENT_INTRO_BLOCK_MAX_WIDTH,
              child: StudyContentIntroDesc(
                  studyEnabledVN: studyEnabledVN,
                  d_studyEnabledVN: d_studyEnabledVN)),
        ]);
  }
}
