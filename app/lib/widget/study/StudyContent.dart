import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
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
      @required this.scrollController,
      @required this.project})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ScrollController scrollController;
  final Project project;

  @override
  Widget build(BuildContext context) {
    // SCROLL
    return Scrollbar(
        controller: scrollController,
        isAlwaysShown: true,
        child: ListView(
            // CONTROLLER
            controller: scrollController,
            // CHILDREN
            children: <Widget>[
              // StudyContentThumb
              StudyContentThumb(
                  studyEnabledVN: studyEnabledVN, project: project),

              // StudyContentIntro
              Break.x1(context)
                  ? StudyContentIntroX1(
                      studyEnabledVN: studyEnabledVN, project: project)
                  : StudyContentIntroX234(
                      studyEnabledVN: studyEnabledVN, project: project),

              // StudyContentBlocks (A)
              StudyContentBlocks(
                  studyEnabledVN: studyEnabledVN,
                  project: project,
                  letter: 'A'),

              // StudyContentBlocks (B)
              StudyContentBlocks(
                  studyEnabledVN: studyEnabledVN, project: project, letter: 'B')
            ]));
  }
}
