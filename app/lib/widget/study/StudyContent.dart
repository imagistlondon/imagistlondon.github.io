import 'package:app/config/Break.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/study/StudyContentBlocks.dart';
import 'package:app/widget/study/StudyContentIntroX1.dart';
import 'package:app/widget/study/StudyContentIntroX234.dart';
import 'package:app/widget/study/StudyContentThumb.dart';
import 'package:flutter/material.dart';

class StudyContent extends StatelessWidget {
  const StudyContent(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.scrollController})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    // SCROLL
    return SingleChildScrollView(
        // CONTROLLER
        controller: scrollController,
        // COLUMN
        child: Column(
            // ALIGNMENT
            mainAxisAlignment: MainAxisAlignment.start,
            // CHILDREN
            children: <Widget>[
              // StudyContentThumb
              StudyContentThumb(studyEnabledVN: studyEnabledVN),

              // StudyContentIntro
              Break.x1(context)
                  ? StudyContentIntroX1(studyEnabledVN: studyEnabledVN)
                  : StudyContentIntroX234(studyEnabledVN: studyEnabledVN),

              // StudyContentBlocks (A)
              StudyContentBlocks(studyEnabledVN: studyEnabledVN, letter: 'A'),

              // StudyContentBlocks (B)
              StudyContentBlocks(studyEnabledVN: studyEnabledVN, letter: 'B')
            ]));
  }
}
