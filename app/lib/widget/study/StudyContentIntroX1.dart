import 'package:app/config/Design.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/study/StudyContentIntroDesc.dart';
import 'package:app/widget/study/StudyContentIntroSubtitle.dart';
import 'package:app/widget/study/StudyContentIntroTitle.dart';
import 'package:flutter/material.dart';

class StudyContentIntroX1 extends StatelessWidget {
  const StudyContentIntroX1(
      {Key key, @required this.studyEnabledVN, @required this.d_studyEnabledVN})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;

  static const SizedBox gap = const SizedBox(height: Design.SPACE);

  @override
  Widget build(BuildContext context) {
    print('StudyContentIntroX1.build');
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
              StudyContentIntroTitle(
                  studyEnabledVN: studyEnabledVN,
                  d_studyEnabledVN: d_studyEnabledVN),
              // subtitle
              StudyContentIntroSubtitle(
                  studyEnabledVN: studyEnabledVN,
                  d_studyEnabledVN: d_studyEnabledVN),
              // gap
              gap,
              // description
              StudyContentIntroDesc(
                  studyEnabledVN: studyEnabledVN,
                  d_studyEnabledVN: d_studyEnabledVN)
            ]));
  }
}
