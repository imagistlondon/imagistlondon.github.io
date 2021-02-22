import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentThumb extends StatelessWidget {
  const StudyContentThumb(
      {Key key, @required this.studyEnabledVN, @required this.project})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final Project project;

  @override
  Widget build(BuildContext context) {
    // skip if no image
    if (project.studyImage == null) return SizedBox.shrink();

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
      image: Images.of(project.studyImage),
    );
  }
}
