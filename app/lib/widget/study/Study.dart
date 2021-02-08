import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
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
      @required this.progressFractionVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<double> progressFractionVN;

  @override
  StudyState createState() => StudyState();
}

class StudyState extends State<Study> {
  final ScrollController scrollController = ScrollController();

  // static
  static final Matrix4 matrixA = Matrix4Transform().up(0).matrix4;

  @override
  void initState() {
    super.initState();

    // scroll listener
    scrollController.addListener(() {
      widget.progressFractionVN.value =
          scrollController.offset / scrollController.position.maxScrollExtent;
    });
  }

  Widget child;

  @override
  Widget build(BuildContext context) {
    // calculate sizes
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // move down (to close it)
    final Matrix4 matrixB =
        Matrix4Transform().down(MediaQuery.of(context).size.height).matrix4;

    // L1
    return L1(widget.studyEnabledVN,
        // VISIBLE
        (studyEnabled) {
      // if new study, rebuild child
      if (studyEnabled != null) {
        child = Container(
            color: Design.BACKGROUND_COLOR,
            width: width,
            height: height,
            child: Stack(children: <Widget>[
              // content
              StudyContent(
                  indexVN: widget.indexVN,
                  studyEnabledVN: widget.studyEnabledVN,
                  scrollController: scrollController),

              // X
              StudyClose(
                  indexVN: widget.indexVN,
                  studyEnabledVN: widget.studyEnabledVN,
                  progressFractionVN: widget.progressFractionVN,
                  scrollController: scrollController),

              // ARROW
              StudyArrow(
                  indexVN: widget.indexVN,
                  studyEnabledVN: widget.studyEnabledVN,
                  scrollController: scrollController)
            ]));
      }

      // animate slide up/down
      return AnimatedContainer(
          // duration
          duration: Design.STUDY_TRANSLATE_ANIMATION_DURATION,
          // curve
          curve: Design.STUDY_TRANSLATE_ANIMATION_CURVE,
          // transform
          transform: studyEnabled != null ? matrixA : matrixB,
          // child
          child: child);
    });
  }
}
