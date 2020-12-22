import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/Section.dart';
import 'package:flutter/material.dart';

class StudyContentBlocks extends StatelessWidget {
  const StudyContentBlocks({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // skip if no blocks
    if (studyEnabledVN.value.studyBlocks == null) return SizedBox.shrink();

    // calculate fill width
    final double fullWidth = Design.sectionInnerWidth(context);

    // current row of blocks
    int rowIndex = 0;

    // keep track of column position
    double columnPosition = 0;

    // grid
    final List<List<ProjectStudyBlock>> grid = List();

    // init first row
    grid.add(List());

    // allocate rows
    int i = -1;
    for (final ProjectStudyBlock block in studyEnabledVN.value.studyBlocks) {
      i++;

      // calculate width
      double width = Design.sectionInnerWidthPercent(
          context,
          block.widthPercentX1,
          block.widthPercentX2,
          block.widthPercentX3,
          block.widthPercentX4);

      // at end of row or with new element would be too long (move to new row)
      if (columnPosition == fullWidth || (columnPosition + width > fullWidth)) {
        rowIndex++;
        grid.add(List());
        columnPosition = 0;
      }

      // add block to grid row
      grid[rowIndex].add(block);
      columnPosition += width;
    }

    // init elements
    final List<Widget> elements = List();

    // loop through rows
    i = -1;
    for (final List<ProjectStudyBlock> rowBlocks in grid) {
      i++;

      // add vertical space
      if (i > 0) elements.add(SizedBox(width: fullWidth, height: Design.SPACE));

      // loop through columns
      int j = -1;
      for (final ProjectStudyBlock block in rowBlocks) {
        j++;
        // calculate width
        double width = Design.sectionInnerWidthPercent(
            context,
            block.widthPercentX1,
            block.widthPercentX2,
            block.widthPercentX3,
            block.widthPercentX4);

        // remove spacer width
        if (rowBlocks.length > 1) {
          final double totalSpacerWidth = (rowBlocks.length - 1) * Design.SPACE;
          width -= totalSpacerWidth / rowBlocks.length;
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
                        block.minHeightX1,
                        block.minHeightX2,
                        block.minHeightX3,
                        block.minHeightX4,
                        0.0),
                    maxHeight: Break.decideOr(
                        context,
                        block.maxHeightX1,
                        block.maxHeightX2,
                        block.maxHeightX3,
                        block.maxHeightX4,
                        double.infinity)),
                // IMAGE
                child: Image(
                    // fit
                    fit: Design.STUDY_CONTENT_IMAGE_BOX_FIT,
                    // width
                    width: width,
                    // image
                    image: AssetImage(block.image))));
      }
    }

    // CONTAINER
    return Container(
        // SCREEN WIDTH
        width: Design.screenWidth(context),
        // BACKGROUND COLOR
        color: Design.STUDY_CONTENT_BLOCKS_BACKGROUND_COLOR,
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
