import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:flutter/material.dart';

class StudyContentImagesX234 extends StatelessWidget {
  const StudyContentImagesX234({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // CONTAINER
    return Container(
        // PADDING
        padding: EdgeInsets.all(Design.gap(context)),
        // COLUMN
        child: Wrap(children: <Widget>[
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
