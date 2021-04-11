import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentThumb extends StatefulWidget {
  const StudyContentThumb(
      {Key key, @required this.studyEnabledVN, @required this.d_studyEnabledVN})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;

  @override
  StudyContentThumbState createState() => StudyContentThumbState();
}

class StudyContentThumbState extends State<StudyContentThumb>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    Images.disposeGifControllers(this);
  }

  @override
  Widget build(BuildContext context) {
    print('StudyContentThumb.build');

    // width
    final double width = MediaQuery.of(context).size.width;

    // height
    double height = MediaQuery.of(context).size.height *
        Design.STUDY_THUMB_DEFAULT_HEIGHT_RATIO;
    if (height < Design.STUDY_THUMB_MIN_HEIGHT)
      height = Design.STUDY_THUMB_MIN_HEIGHT;
    if (height > Design.STUDY_THUMB_MAX_HEIGHT)
      height = Design.STUDY_THUMB_MAX_HEIGHT;

    return L1(
        widget.d_studyEnabledVN,
        (Project project) => Images.of(
            project != null ? project.studyImage : null,
            width: width,
            height: height,
            fit: BoxFit.cover,
            gifDuration: project != null ? project.studyImageGifDuration : null,
            vsync: this));
  }
}
