import 'package:app/config/Design.dart';
import 'package:app/util/Arrow.dart';
import 'package:flutter/material.dart';

class StudyArrow extends StatelessWidget {
  const StudyArrow({Key key, @required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  void onTap() {
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: Design.STUDY_SCROLL_TO_TOP_ANIMATION_DURATION,
        curve: Design.STUDY_SCROLL_TO_TOP_ANIMATION_CURVE);
  }

  @override
  Widget build(BuildContext context) {
    print('StudyArrow.build');
    // ALIGN
    return Align(
        alignment: Alignment.bottomRight,
        // ARROW
        child: Arrow(
            // TAP
            onTap: onTap,
            // PADDING
            padding: EdgeInsets.all(Design.gap(context)),
            // COLOR
            color: Design.STUDY_ARROW_COLOR));
  }
}
