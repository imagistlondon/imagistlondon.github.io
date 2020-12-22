import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/Section.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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

        // figure out text align
        TextAlign textAlign = TextAlign.left;
        if (block.textAlignX == 'CENTER' || block.textAlignX == 'center')
          textAlign = TextAlign.center;
        if (block.textAlignX == 'END' || block.textAlignX == 'end')
          textAlign = TextAlign.right;

        // build title widget
        final Widget titleWidget = block.title != null
            ? Container(child: H1(text: block.title, textAlign: textAlign))
            : SizedBox.shrink();

        // build desc widget (if needed)
        final Widget descWidget = block.desc != null
            ? Container(child: P(text: block.desc, textAlign: textAlign))
            : SizedBox.shrink();

        // has text
        final bool hasText = (block.title != null || block.desc != null);

        // text spacer
        final Widget textSpacer = hasText
            ? SizedBox(width: Design.SPACE, height: Design.SPACE)
            : SizedBox.shrink();

        // figure out text align
        CrossAxisAlignment textAlignX = CrossAxisAlignment.start;
        if (block.textAlignX == 'CENTER' || block.textAlignX == 'center')
          textAlignX = CrossAxisAlignment.center;
        if (block.textAlignX == 'END' || block.textAlignX == 'end')
          textAlignX = CrossAxisAlignment.end;

        // build text widget
        final Widget textWidget = Column(
            crossAxisAlignment: textAlignX,
            children: [titleWidget, textSpacer, descWidget]);

        // build image widget (if needed)
        final Widget imageWidget = block.image != null
            ? Image(
                // fit
                fit: Design.STUDY_CONTENT_IMAGE_BOX_FIT,
                // image
                image: AssetImage(block.image))
            : SizedBox.shrink();

        // whether has content
        final bool hasContent = hasText || block.image != null;
        final bool hasFullContent = hasText && block.image != null;

        // build space widget (if needed)
        final Widget blockSpacer = hasFullContent
            ? SizedBox(width: Design.SPACE, height: Design.SPACE)
            : SizedBox.shrink();

        // calculate width split (for rows)
        final double widthRowSplit = (width / 2) - (Design.SPACE / 2);

        // text width for the row
        final Widget textWidgetForRow = hasFullContent
            ? Container(width: widthRowSplit, child: textWidget)
            : hasText
                ? Container(width: width, child: textWidget)
                : textWidget;

        // image widget for the row
        final Widget imageWidgetForRow = hasFullContent
            ? Container(width: widthRowSplit, child: imageWidget)
            : block.image != null
                ? Container(width: width, child: imageWidget)
                : imageWidget;

        // figure out text align vertical
        CrossAxisAlignment textAlignY = CrossAxisAlignment.start;
        if (block.textAlignY == 'CENTER' || block.textAlignY == 'center')
          textAlignY = CrossAxisAlignment.center;
        if (block.textAlignY == 'END' || block.textAlignY == 'end')
          textAlignY = CrossAxisAlignment.end;

        // LEFT
        Widget widget = Row(
            crossAxisAlignment: textAlignY,
            children: [textWidgetForRow, blockSpacer, imageWidgetForRow]);

        // TOP
        if (block.textPosition == 'TOP')
          widget = Column(
              crossAxisAlignment: textAlignX,
              children: [textWidget, blockSpacer, imageWidget]);

        // RIGHT
        if (block.textPosition == 'RIGHT')
          widget = Row(
              crossAxisAlignment: textAlignY,
              children: [imageWidgetForRow, blockSpacer, textWidgetForRow]);

        // BOTTOM
        if (block.textPosition == 'BOTTOM')
          widget = Column(
              crossAxisAlignment: textAlignX,
              children: [imageWidget, blockSpacer, textWidget]);

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
                // CHILD
                child: Container(
                    color:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                    width: width,
                    child: widget)));
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
                // elements
                children: elements)));
  }
}
