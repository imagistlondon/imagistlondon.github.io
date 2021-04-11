import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentIntroTitle extends StatelessWidget {
  const StudyContentIntroTitle(
      {Key key, @required this.studyEnabledVN, @required this.d_studyEnabledVN})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;

  static const TextStyle style =
      const TextStyle(color: Design.STUDY_CONTENT_INTRO_TITLE_COLOR);

  @override
  Widget build(BuildContext context) {
    print('StudyContentIntroTitle.build');
    return L1(
      d_studyEnabledVN,
      (Project project) => H1(
          text: project != null ? project.title : 'Loading...',
          selectable: true,
          style: style),
    );
  }
}
