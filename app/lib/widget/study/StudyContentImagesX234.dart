import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:flutter/material.dart';

class StudyContentImagesX234 extends StatelessWidget {
  const StudyContentImagesX234({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // skip if no images
    if (studyEnabledVN.value.studyImages == null) return SizedBox.shrink();

    // init elements
    final List<Widget> elements = List();

    // calculate fill width
    final double fullWidth = Design.sectionInnerWidth(context);

    // keep track of column position
    double columnPosition = 0;

    // LOOP
    int i = -1;
    for (final ProjectStudyImage image in studyEnabledVN.value.studyImages) {
      // increment
      i++;

      // calculate width
      double width = Design.sectionInnerWidthPercent(
          context,
          image.widthPercentX1,
          image.widthPercentX2,
          image.widthPercentX3,
          image.widthPercentX4);

      // add vertical devider if new element will be placed on new line
      if (columnPosition == 0 && i > 0) {
        elements.add(SizedBox(width: fullWidth, height: Design.SPACE));
      }

      // move column position
      columnPosition += width;

      // if too large to fit in existing row then take new line with occupied space
      if (columnPosition > fullWidth) {
        columnPosition = width;
      }

      // if also takes complete new line then we reset
      if (columnPosition >= fullWidth) {
        columnPosition = 0;
      }
      // // otherwise we have space on the right so let's add divider
      // else {
      //   elements.add(SizedBox(width: Design.SPACE));
      //   width -= (Design.SPACE / 2);
      // }

      // add element
      elements.add(
          // CONSTRAINED BOX
          ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: Break.decideOr(
                      context,
                      image.minHeightX1,
                      image.minHeightX2,
                      image.minHeightX3,
                      image.minHeightX4,
                      0.0),
                  maxHeight: Break.decideOr(
                      context,
                      image.maxHeightX1,
                      image.maxHeightX2,
                      image.maxHeightX3,
                      image.maxHeightX4,
                      double.infinity)),
              // IMAGE
              child: Image(
                  // fit
                  fit: Design.STUDY_CONTENT_IMAGE_BOX_FIT,
                  // width
                  width: width,
                  // image
                  image: AssetImage(image.url))));
    }

    // CONTAINER
    return Container(
        // PADDING
        padding: EdgeInsets.all(Design.gap(context)),
        // WRAP
        child: Wrap(
            // position elements vertically in center
            crossAxisAlignment: Design.STUDY_CONTENT_IMAGES_CROSS_ALIGNMENT,
            children: elements));
  }
}
