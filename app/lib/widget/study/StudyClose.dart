import 'dart:async';

import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/X.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyClose extends StatefulWidget {
  const StudyClose(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.progressFractionVN,
      @required this.scrollController,
      @required this.project})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<double> progressFractionVN;
  final ScrollController scrollController;
  final Project project;

  @override
  StudyCloseState createState() => StudyCloseState();
}

class StudyCloseState extends State<StudyClose> {
  // timer to reset scroll position after close
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  void onTap() {
    widget.studyEnabledVN.value = null;

    // progressFractionVN.value = 0.0;

    // reset timer if needed
    if (timer != null) {
      timer.cancel();
      timer = null;
    }

    // wait for study translation animation to finish
    timer = Timer(Design.STUDY_TRANSLATE_ANIMATION_DURATION, () {
      // jump to (without animation to 0)
      widget.scrollController
          .jumpTo(widget.scrollController.position.minScrollExtent);
    });
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
                vertical: Design.studyCloseClearance(context)),
            // COLOR
            color: Design.STUDY_X_COLOR,
          )
        ]);
  }
}
