import 'package:app/config/Content.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentIntroDesc extends StatelessWidget {
  const StudyContentIntroDesc(
      {Key key, @required this.studyEnabledVN, @required this.d_studyEnabledVN})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    print('StudyContentIntroDesc.build');
    return L1(
      d_studyEnabledVN,
      (Project project) => P(
          text: project != null ? project.desc : 'Loading...',
          selectable: true),
    );
  }
}
