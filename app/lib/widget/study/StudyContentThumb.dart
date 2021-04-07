import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class StudyContentThumb extends StatefulWidget {
  const StudyContentThumb(
      {Key key, @required this.studyEnabledVN, @required this.project})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final Project project;

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
    // skip if no image
    if (widget.project.studyImage == null) return SizedBox.shrink();

    // width
    final double width = MediaQuery.of(context).size.width;

    // height
    double height = MediaQuery.of(context).size.height *
        Design.STUDY_THUMB_DEFAULT_HEIGHT_RATIO;
    if (height < Design.STUDY_THUMB_MIN_HEIGHT)
      height = Design.STUDY_THUMB_MIN_HEIGHT;
    if (height > Design.STUDY_THUMB_MAX_HEIGHT)
      height = Design.STUDY_THUMB_MAX_HEIGHT;

    return Images.of(widget.project.studyImage,
        width: width,
        height: height,
        fit: BoxFit.cover,
        gifDuration: widget.project.studyImageGifDuration,
        vsync: this);
  }
}
