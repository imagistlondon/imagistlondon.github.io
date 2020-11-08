import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:flutter/material.dart';

class StudyContentThumb extends StatelessWidget {
  const StudyContentThumb({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // width
    final double width = MediaQuery.of(context).size.width;

    // height
    double height = MediaQuery.of(context).size.height *
        Design.STUDY_THUMB_DEFAULT_HEIGHT_RATIO;
    if (height < Design.STUDY_THUMB_MIN_HEIGHT)
      height = Design.STUDY_THUMB_MIN_HEIGHT;
    if (height > Design.STUDY_THUMB_MAX_HEIGHT)
      height = Design.STUDY_THUMB_MAX_HEIGHT;

    return Image(
      width: width,
      height: height,
      fit: BoxFit.cover,
      image: AssetImage(studyEnabledVN.value.imageThumb),
    );
  }
}
