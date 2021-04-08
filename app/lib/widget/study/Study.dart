import 'package:app/config/Content.dart';
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
      @required this.progressFractionVN,
      @required this.project})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<double> progressFractionVN;
  final Project project;

  @override
  StudyState createState() => StudyState();
}

class StudyState extends State<Study> {
  // scroll controller
  final ScrollController scrollController = ScrollController();

  // static position A
  static final Matrix4 matrixA = Matrix4Transform().up(0).matrix4;

  @override
  void initState() {
    print('Study.initState.' + widget.project.key);
    super.initState();

    // scroll listener
    scrollController.addListener(() {
      widget.progressFractionVN.value =
          scrollController.offset / scrollController.position.maxScrollExtent;
    });
  }

  @override
  void dispose() {
    print('Study.dispose');
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Study.build.' + widget.project.key);

    // calculate sizes
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // move down (to close it)
    final Matrix4 matrixB =
        Matrix4Transform().down(MediaQuery.of(context).size.height).matrix4;

    // build main child
    final Widget child = Container(
        color: Design.BACKGROUND_COLOR,
        width: width,
        height: height,
        child: Stack(children: <Widget>[
          // content
          StudyContent(
              indexVN: widget.indexVN,
              studyEnabledVN: widget.studyEnabledVN,
              scrollController: scrollController,
              project: widget.project),

          // X
          StudyClose(
              indexVN: widget.indexVN,
              studyEnabledVN: widget.studyEnabledVN,
              progressFractionVN: widget.progressFractionVN,
              scrollController: scrollController,
              project: widget.project),

          // ARROW
          StudyArrow(
              indexVN: widget.indexVN,
              studyEnabledVN: widget.studyEnabledVN,
              scrollController: scrollController,
              project: widget.project)
        ]));

    // L1 (studyEnabled)
    return L1(widget.studyEnabledVN, (final Project studyEnabled) {
      // whether the study enabled is my project
      final bool match =
          studyEnabled != null && studyEnabled.key == widget.project.key;

      print('Study.L1.' +
          widget.project.key +
          '.studyEnabled.' +
          (studyEnabled != null ? studyEnabled.key : 'null') +
          '.' +
          (match ? 'match' : 'skip'));

      // animate slide up/down
      return AnimatedContainer(
          // duration
          duration: Design.STUDY_TRANSLATE_ANIMATION_DURATION,
          // curve
          curve: Design.STUDY_TRANSLATE_ANIMATION_CURVE,
          // transform
          transform: match ? matrixA : matrixB,
          // child
          child: child);
    });
  }
}
