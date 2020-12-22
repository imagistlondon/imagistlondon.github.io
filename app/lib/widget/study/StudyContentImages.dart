import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/Section.dart';
import 'package:flutter/material.dart';

class StudyContentImages extends StatelessWidget {
  const StudyContentImages({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // skip if no images
    if (studyEnabledVN.value.studyImages == null) return SizedBox.shrink();

    // calculate fill width
    final double fullWidth = Design.sectionInnerWidth(context);

    // current row of images
    int rowIndex = 0;

    // keep track of column position
    double columnPosition = 0;

    // grid
    final List<List<ProjectStudyImage>> grid = List();

    // init first row
    grid.add(List());

    // allocate rows
    int i = -1;
    for (final ProjectStudyImage image in studyEnabledVN.value.studyImages) {
      i++;

      // calculate width
      double width = Design.sectionInnerWidthPercent(
          context,
          image.widthPercentX1,
          image.widthPercentX2,
          image.widthPercentX3,
          image.widthPercentX4);

      // at end of row or with new element would be too long (move to new row)
      if (columnPosition == fullWidth || (columnPosition + width > fullWidth)) {
        rowIndex++;
        grid.add(List());
        columnPosition = 0;
      }

      // add image to grid row
      grid[rowIndex].add(image);
      columnPosition += width;
    }

    // init elements
    final List<Widget> elements = List();

    // loop through rows
    i = -1;
    for (final List<ProjectStudyImage> rowImages in grid) {
      i++;

      // add vertical space
      if (i > 0) elements.add(SizedBox(width: fullWidth, height: Design.SPACE));

      // loop through columns
      int j = -1;
      for (final ProjectStudyImage image in rowImages) {
        j++;
        // calculate width
        double width = Design.sectionInnerWidthPercent(
            context,
            image.widthPercentX1,
            image.widthPercentX2,
            image.widthPercentX3,
            image.widthPercentX4);

        // remove spacer width
        if (rowImages.length > 1) {
          final double totalSpacerWidth = (rowImages.length - 1) * Design.SPACE;
          width -= totalSpacerWidth / rowImages.length;
        }

        // add horizontal space
        if (j > 0) {
          elements.add(SizedBox(width: Design.SPACE, height: Design.SPACE));
        }

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
    }

    // CONTAINER
    return Container(
        // SCREEN WIDTH
        width: Design.screenWidth(context),
        // BACKGROUND COLOR
        color: Design.STUDY_CONTENT_IMAGES_BACKGROUND_COLOR,
        // SECTION
        child: Section(
            // GAP (HORIZONTAL PADDING)
            gap: true,
            // VERTICAL PADDING
            padding: EdgeInsets.symmetric(vertical: Design.gap(context)),
            // WRAP
            child: Wrap(
                // position elements vertically in center
                crossAxisAlignment: Design.STUDY_CONTENT_IMAGES_CROSS_ALIGNMENT,
                children: elements)));
  }
}
