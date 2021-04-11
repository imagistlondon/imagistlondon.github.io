import 'dart:async';

import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/Video.dart';
import 'package:app/widget/study/StudyArrow.dart';
import 'package:app/widget/study/StudyClose.dart';
import 'package:app/widget/study/StudyContent.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class Study extends StatefulWidget {
  const Study(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.cinemaEnabledVN,
      @required this.progressFractionVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<Video> cinemaEnabledVN;
  final ValueNotifier<double> progressFractionVN;

  @override
  StudyState createState() => StudyState();
}

class StudyState extends State<Study> {
  // open position
  static final Matrix4 matrixA = Matrix4Transform().translate(y: 0).matrix4;

  // scroll controller
  final ScrollController scrollController = ScrollController();

  // delayed studyEnabledVN (basically copies what happend to studyEnabled after delay)
  final StudyEnabledNotifier d_studyEnabledVN = StudyEnabledNotifier(null);

  // this waits for the close/open animation to end then calls animationNotifier
  Timer d_studyEnabledTimer;

  @override
  void initState() {
    print('Study.initState');
    super.initState();

    // scroll listener
    scrollController.addListener(() {
      // updates the progress bar
      widget.progressFractionVN.value =
          scrollController.offset / scrollController.position.maxScrollExtent;
    });

    // listen on studyEnabled changes to update d_studyEnabledVN (after delay)
    widget.studyEnabledVN.addListener(() {
      print('Study.d_studyEnabledTimer.start');
      // wait for study translation animation to finish
      d_studyEnabledTimer =
          Timer(Design.STUDY_TRANSLATE_ANIMATION_DURATION, () {
        print('Study.d_studyEnabledTimer.end');

        // copy over the value from normal studyEnabled
        d_studyEnabledVN.value = widget.studyEnabledVN.value;

        // if not showing study, then jump to (without animation to 0)
        if (d_studyEnabledVN.value == null)
          scrollController.jumpTo(scrollController.position.minScrollExtent);
      });
    });
  }

  @override
  void dispose() {
    print('Study.dispose');
    super.dispose();
    scrollController.dispose();
    d_studyEnabledVN.dispose();
    if (d_studyEnabledTimer != null) {
      d_studyEnabledTimer.cancel();
      d_studyEnabledTimer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Study.build');

    // calculate sizes
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // hidden position
    final Matrix4 matrixB = Matrix4Transform().translate(y: height).matrix4;

    // StudyContent
    final StudyContent studyContent = StudyContent(
        indexVN: widget.indexVN,
        studyEnabledVN: widget.studyEnabledVN,
        d_studyEnabledVN: d_studyEnabledVN,
        cinemaEnabledVN: widget.cinemaEnabledVN,
        scrollController: scrollController);

    // StudyClose
    final StudyClose studyClose =
        StudyClose(studyEnabledVN: widget.studyEnabledVN);

    // StudyArrow
    final StudyArrow studyArrow =
        StudyArrow(scrollController: scrollController);

    // container
    final Container container = Container(
        color: Design.BACKGROUND_COLOR,
        width: width,
        height: height,
        child: Stack(children: <Widget>[studyContent, studyClose, studyArrow]));

    // L1 (studyEnabled)
    return L1(widget.studyEnabledVN, (Project studyEnabled) {
      // animate slide up/down
      return AnimatedContainer(
          // duration
          duration: Design.STUDY_TRANSLATE_ANIMATION_DURATION,
          // curve
          curve: Design.STUDY_TRANSLATE_ANIMATION_CURVE,
          // transform
          transform: studyEnabled != null ? matrixA : matrixB,
          // child
          child: container);
    });
  }
}
