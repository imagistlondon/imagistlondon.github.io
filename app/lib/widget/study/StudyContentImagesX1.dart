import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:flutter/material.dart';

class StudyContentImagesX1 extends StatelessWidget {
  const StudyContentImagesX1({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // skip if no images
    if (studyEnabledVN.value.studyImages == null) return SizedBox.shrink();

    // CONTAINER
    return Container(
        // PADDING
        padding: EdgeInsets.all(Design.gap(context)),
        // COLUMN
        child: Column(children: <Widget>[
          // LOOP
          for (final ProjectStudyImage image
              in studyEnabledVN.value.studyImages)
            // COLUMN
            Column(children: <Widget>[
              // IMAGE
              Image(
                  // FULL WIDTH
                  width: Design.sectionInnerWidth(context),
                  // URL
                  image: AssetImage(image.url)),
              // GAP
              const SizedBox(height: Design.SPACE)
            ]),
        ]));
  }
}
