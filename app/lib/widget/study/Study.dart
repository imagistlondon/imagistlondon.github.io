import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/study/StudyArrow.dart';
import 'package:app/widget/study/StudyClose.dart';
import 'package:app/widget/study/StudyContent.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    // scroll listener
    scrollController.addListener(() {
      widget.progressFractionVN.value =
          scrollController.offset / scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    // size
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // L1
    return L1(widget.studyEnabledVN,
        // VISIBLE
        (studyEnabled) {
      // skip if no study
      if (studyEnabled == null) return SizedBox.shrink();

      // CONTAINER
      return Container(
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
            ),

            // ARROW
            StudyArrow(
                indexVN: widget.indexVN,
                studyEnabledVN: widget.studyEnabledVN,
                scrollController: scrollController)
          ]));
    });
  }
}
