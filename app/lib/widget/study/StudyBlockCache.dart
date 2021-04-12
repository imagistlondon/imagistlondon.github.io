import 'dart:async';

import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/Video.dart';
import 'package:app/util/VideoBox.dart';
import 'package:flutter/material.dart';

class StudyBlockCache {
  // shrink
  static const SHRINK = const SizedBox.shrink();

  // Horizontal Space
  static const HOR_SPACE =
      const SizedBox(width: Design.SPACE, height: Design.SPACE);

  // fields
  final BuildContext context;
  final List<ProjectStudyBlock> blocks;
  final ValueNotifier<Video> cinemaEnabledVN;
  final TickerProviderStateMixin vsync;

  // constructor
  StudyBlockCache(
      {@required this.context,
      @required this.blocks,
      @required this.cinemaEnabledVN,
      @required this.vsync});

  // timers (for thinks like multi images in place)
  List<Timer> timers = [];

  ////////////////////////////////////// FULL WIDTH
  double fullWidth_ = null;
  double fullWidth(final BuildContext context) {
    if (fullWidth_ == null) fullWidth_ = Design.screenWidth(context);
    return fullWidth_;
  }

  ////////////////////////////////////// BLOCK WIDTHS
  List<double> blockWidths_ = null;
  double blockWidth(final int index) {
    // skip if already done
    if (blockWidths_ != null) return blockWidths_[index];

    // otherwise build
    blockWidths_ = [];
    for (ProjectStudyBlock block in blocks) {
      blockWidths_.add(Design.screenWidthPercent(
          context,
          block.widthPercentX1,
          block.widthPercentX2,
          block.widthPercentX3,
          block.widthPercentX4,
          Design.STUDY_CONTENT_BLOCKS_DEFAULT_WIDTH_PERCENT));
    }
    return blockWidths_[index];
  }

  ////////////////////////////////////// GRID BLOCK
  List<List<ProjectStudyBlock>> gridBlocks_ = null;
  List<List<ProjectStudyBlock>> gridBlocks() {
    // skip if already done
    if (gridBlocks_ != null) return gridBlocks_;

    // initialize grid
    gridBlocks_ = [];

    // init first row
    gridBlocks_.add([]);

    // current row of blocks
    int rowIndex = 0;

    // keep track of column position
    double columnPosition = 0;

    // allocate rows
    int i = -1;
    for (ProjectStudyBlock block in blocks) {
      i++;

      // at end of row or with new element would be too long (move to new row)
      if (columnPosition == fullWidth(context) ||
          (columnPosition + blockWidth(i) > fullWidth(context))) {
        rowIndex++;
        gridBlocks_.add([]);
        columnPosition = 0;
      }

      // add block to grid row
      gridBlocks_[rowIndex].add(block);
      columnPosition += blockWidth(i);
    }
    return gridBlocks_;
  }

  int gridBlocksSize() {
    return gridBlocks().length;
  }

  ////////////////////////////////////// GRID WIDGETS
  final Map<int, List<Widget>> gridWidgets_ = Map();
  List<Widget> rowWidgets(final int index) {
    // skip if already done
    if (gridWidgets_.containsKey(index)) return gridWidgets_[index];

    // pull row blocks from grid blocks
    final List<ProjectStudyBlock> rowBlocks = gridBlocks()[index];
    final int rowBlocksLength = rowBlocks.length;

    // init row
    gridWidgets_[index] = [];

    // loop through columns
    int j = -1;
    for (ProjectStudyBlock block in rowBlocks) {
      j++;
      // calculate block width
      double width = blockWidth(j);

      // remove spacer width
      if (rowBlocksLength > 1) {
        final double totalSpacerWidth = (rowBlocksLength - 1) * Design.SPACE;
        width -= totalSpacerWidth / rowBlocksLength;
      }

      // add horizontal space
      if (j > 0) gridWidgets_[index].add(HOR_SPACE);

      // build title widget
      final Widget titleWidget = block.hasTitle
          ? Container(
              child: H1(
                  text: block.title,
                  textAlign: block.textAlign,
                  selectable: true))
          : SHRINK;

      // build desc widget (if needed)
      final Widget descWidget = block.hasDesc
          ? Container(
              child: P(
                  text: block.desc,
                  textAlign: block.textAlign,
                  selectable: true))
          : SHRINK;

      // text spacer
      final Widget textSpacer = block.hasText
          ? const SizedBox(width: Design.SPACE, height: Design.SPACE)
          : SHRINK;

      // build text widget
      final Widget textWidget = Column(
          crossAxisAlignment: block.textAlignCrossX,
          children: [titleWidget, textSpacer, descWidget]);

      // build video widget
      final Widget videoWidget = block.hasVideo
          ? VideoBox(
              width: width,
              video: block.video,
              cinemaEnabledVN: cinemaEnabledVN)
          : SHRINK;

      // build image widget (if needed)

      // value notifier for the current in view block image (for multi images)
      final ValueNotifier<int> blockImageIndexVN = ValueNotifier(0);

      // add timer to switch between image indexes
      if (block.hasMultiImages) {
        timers.add(Timer.periodic(
            Design.STUDY_CONTENT_IMAGE_TRANSTION_ANIMATION_DURATION, (t) {
          // increment
          blockImageIndexVN.value =
              (blockImageIndexVN.value + 1) % block.images.length;
        }));
      }

      // build image widget (if needed)
      final Widget imageWidget = block.hasImage
          ?
          // IMAGE
          Stack(children: <Widget>[
              for (int imageIndex = 0;
                  imageIndex < block.images.length;
                  imageIndex++)
                // CONSTRAINED BOX
                ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: Break.decideOr(
                            context,
                            block.imageMinHeightX1,
                            block.imageMinHeightX2,
                            block.imageMinHeightX3,
                            block.imageMinHeightX4,
                            0.0),
                        maxHeight: Break.decideOr(
                            context,
                            block.imageMaxHeightX1,
                            block.imageMaxHeightX2,
                            block.imageMaxHeightX3,
                            block.imageMaxHeightX4,
                            double.infinity)),
                    // L1
                    child: L1(
                        blockImageIndexVN,
                        (imageIndexEnabled) =>
                            // ANIMATED OPACITY
                            AnimatedOpacity(
                                // duration
                                duration: Design
                                    .STUDY_CONTENT_IMAGE_OPACITY_ANIMATION_DURATION,
                                // curve
                                curve: Design
                                    .STUDY_CONTENT_IMAGE_OPACITY_ANIMATION_CURVE,
                                // opacity
                                opacity:
                                    imageIndexEnabled == imageIndex ? 1 : 0,
                                // IMAGE
                                child: Images.of(block.images[imageIndex],
                                    // fit
                                    fit: Design.STUDY_CONTENT_IMAGE_BOX_FIT,
                                    // width
                                    width: width,
                                    // gif duration (for gifs in safari)
                                    gifDuration:
                                        block.imageGifDurations[imageIndex],
                                    // vsync (for gifs in safari)
                                    vsync: vsync))))
            ])
          : SHRINK;

      // media widget
      final Widget mediaWidget = block.hasVideo ? videoWidget : imageWidget;

      // build space widget (if needed)
      final Widget blockSpacer = block.hasFullContent
          ? const SizedBox(width: Design.SPACE, height: Design.SPACE)
          : SHRINK;

      // calculate width split (for rows)
      final double widthRowSplit = (width / 2) - (Design.SPACE / 2);

      // text width for the row
      final Widget textWidgetForRow = block.hasFullContent
          ? Container(width: widthRowSplit, child: textWidget)
          : block.hasText
              ? Container(width: width, child: textWidget)
              : textWidget;

      // video widget for the row
      final Widget videoWidgetForRow = block.hasFullContent
          ? Container(width: widthRowSplit, child: videoWidget)
          : block.hasVideo
              ? Container(width: width, child: videoWidget)
              : videoWidget;

      // image widget for the row
      final Widget imageWidgetForRow = block.hasFullContent
          ? Container(width: widthRowSplit, child: imageWidget)
          : block.hasImage
              ? Container(width: width, child: imageWidget)
              : imageWidget;

      // media widget for row
      final Widget mediaWidgetForRow =
          block.hasVideo ? videoWidgetForRow : imageWidgetForRow;

      // LEFT
      Widget w = Row(
          crossAxisAlignment: block.textAlignCrossY,
          children: [textWidgetForRow, blockSpacer, mediaWidgetForRow]);

      // TOP
      if (block.textPosition == 'TOP')
        w = Column(
            crossAxisAlignment: block.textAlignCrossX,
            children: [textWidget, blockSpacer, mediaWidget]);

      // RIGHT
      if (block.textPosition == 'RIGHT')
        w = Row(
            crossAxisAlignment: block.textAlignCrossY,
            children: [mediaWidgetForRow, blockSpacer, textWidgetForRow]);

      // BOTTOM
      if (block.textPosition == 'BOTTOM')
        w = Column(
            crossAxisAlignment: block.textAlignCrossX,
            children: [mediaWidget, blockSpacer, textWidget]);

      // add element
      gridWidgets_[index].add(
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
                  // color:
                  //     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  //         .withOpacity(1.0),
                  width: width,
                  child: w)));
    }

    return gridWidgets_[index];
  }

  ////////////////////////////////////// GRID CONTAINERS
  final Map<int, Container> gridContainers_ = Map();
  Container rowContainer(
      final BuildContext context, final int index, final Color color) {
    // skip if already cached
    if (gridContainers_.containsKey(index)) return gridContainers_[index];

    // CONTAINER
    gridContainers_[index] = Container(
        // SCREEN WIDTH
        width: fullWidth(context),
        // BACKGROUND COLOR
        color: color,
        // VERTICAL PADDING
        padding: EdgeInsets.only(top: Design.SPACE), //Design.gap(context)),
        // Row of widgets
        child: Row(
            mainAxisAlignment: Design.STUDY_CONTENT_BLOCKS_ALIGNMENT_X,
            crossAxisAlignment: Design.STUDY_CONTENT_BLOCKS_ALIGNMENT_Y,
            children: rowWidgets(index)));

    return gridContainers_[index];
  }

  ////////////////////////////////////// ELEMENTS
  List<Widget> elements_ = null;
  List<Widget> elements() {
    if (elements_ == null) {
      // init elements
      elements_ = [];

      // loop through rows
      for (int i = 0; i < gridBlocks().length; i++) {
        // add vertical space (using gap)
        // if (i > 0) elements.add(SizedBox(width: fullWidth, height: Design.gap(context)));
        if (i > 0)
          elements_
              .add(SizedBox(width: fullWidth(context), height: Design.SPACE));

        // add row widgets
        elements_.addAll(rowWidgets(i));
      }
    }

    return elements_;
  }
}
