import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/X.dart';
import 'package:app/util/Project.dart';
import 'package:flutter/material.dart';

class StudyClose extends StatelessWidget {
  const StudyClose(
      {Key key, @required this.indexVN, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;

  void onTap() {
    studyEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.end,
        // CHILDREN
        children: <Widget>[
          X(
            // TAP
            onTap: onTap,
            // PADDING
            padding: EdgeInsets.symmetric(
                horizontal: Design.gap(context),
                vertical: Design.gap(context) - Design.SPACE),
            // COLOR
            color: Design.STUDY_X_COLOR,
          )
        ]);
  }
}
