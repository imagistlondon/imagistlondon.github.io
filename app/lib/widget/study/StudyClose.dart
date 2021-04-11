import 'package:app/config/Design.dart';
import 'package:app/text/X.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyClose extends StatelessWidget {
  const StudyClose({Key key, @required this.studyEnabledVN}) : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;

  void onTap() {
    studyEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    print('StudyClose.build');
    // ALIGN
    return Align(
        alignment: Alignment.topRight,
        // X
        child: X(
          // TAP
          onTap: onTap,
          // PADDING
          padding: EdgeInsets.symmetric(
              horizontal: Design.gap(context),
              vertical: Design.studyCloseClearance(context)),
          // COLOR
          color: Design.STUDY_X_COLOR,
        ));
  }
}
