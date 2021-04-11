import 'dart:async';

import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/Video.dart';
import 'package:app/util/VideoBox.dart';
import 'package:flutter/material.dart';

class StudyContentBlocks extends StatefulWidget {
  const StudyContentBlocks(
      {Key key,
      @required this.studyEnabledVN,
      @required this.d_studyEnabledVN,
      @required this.cinemaEnabledVN,
      @required this.project,
      @required this.letter})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;
  final ValueNotifier<Video> cinemaEnabledVN;
  final Project project;
  final String letter;

  @override
  StudyContentBlocksState createState() => StudyContentBlocksState();
}

class StudyContentBlocksState extends State<StudyContentBlocks>
    with TickerProviderStateMixin {
  List<Timer> timers = [];

  @override
  void dispose() {
    print('StudyContentBlocks.dispose');
    super.dispose();

    // clear timers
    if (timers != null && timers.isNotEmpty) {
      for (final Timer timer in timers) {
        if (timer != null) {
          timer.cancel();
        }
      }
      timers.clear();
    }

    // clear gif controllers
    Images.disposeGifControllers(this);
  }

  @override
  Widget build(BuildContext context) {
    print('StudyContentBlocks.build.' + widget.project.key);

    // skip if no blocks
    if (widget.project.studyBlocks == null ||
        widget.project.studyBlocks[widget.letter] == null)
      return const SizedBox.shrink();

    // calculate fill width
    final double fullWidth = Design.screenWidth(context);

    // current row of blocks
    int rowIndex = 0;

    // keep track of column position
    double columnPosition = 0;

    // grid
    final List<List<ProjectStudyBlock>> grid = [];

    // init first row
    grid.add([]);

    // allocate rows
    int i = -1;
    for (final ProjectStudyBlock block
        in widget.project.studyBlocks[widget.letter]) {
      i++;

      // calculate block width
      double width = Design.screenWidthPercent(
          context,
          block.widthPercentX1,
          block.widthPercentX2,
          block.widthPercentX3,
          block.widthPercentX4,
          Design.STUDY_CONTENT_BLOCKS_DEFAULT_WIDTH_PERCENT);

      // at end of row or with new element would be too long (move to new row)
      if (columnPosition == fullWidth || (columnPosition + width > fullWidth)) {
        rowIndex++;
        grid.add([]);
        columnPosition = 0;
      }

      // add block to grid row
      grid[rowIndex].add(block);
      columnPosition += width;
    }

    // init elements
    final List<Widget> elements = [];

    // loop through rows
    i = -1;
    for (final List<ProjectStudyBlock> rowBlocks in grid) {
      i++;

      // add vertical space (using gap)
      // if (i > 0) elements.add(SizedBox(width: fullWidth, height: Design.gap(context)));
      if (i > 0) elements.add(SizedBox(width: fullWidth, height: Design.SPACE));

      // loop through columns
      int j = -1;
      for (final ProjectStudyBlock block in rowBlocks) {
        j++;
        // calculate block width
        double width = Design.screenWidthPercent(
            context,
            block.widthPercentX1,
            block.widthPercentX2,
            block.widthPercentX3,
            block.widthPercentX4,
            Design.STUDY_CONTENT_BLOCKS_DEFAULT_WIDTH_PERCENT);

        // remove spacer width
        if (rowBlocks.length > 1) {
          final double totalSpacerWidth = (rowBlocks.length - 1) * Design.SPACE;
          width -= totalSpacerWidth / rowBlocks.length;
        }

        // add horizontal space
        if (j > 0) {
          elements
              .add(const SizedBox(width: Design.SPACE, height: Design.SPACE));
        }

        // figure out text align
        TextAlign textAlign = TextAlign.left;
        if (block.textAlignX == 'CENTER' || block.textAlignX == 'center')
          textAlign = TextAlign.center;
        if (block.textAlignX == 'END' || block.textAlignX == 'end')
          textAlign = TextAlign.right;

        final bool hasTitle = block.title != null && block.title != "";
        final bool hasDesc = block.desc != null && block.desc != "";
        final bool hasText = hasTitle || hasDesc;
        // final bool hasFullText = hasTitle && hasDesc;

        final bool hasVideo = block.videoId != null && block.videoId != "";
        final bool hasImage = block.image != null && block.image != "";
        final bool hasMultiImages =
            hasImage && block.image2 != null && block.image2 != "";

        final bool hasMedia = hasVideo || hasImage;

        // final bool hasContent = hasText || hasImage || hasVideo;
        final bool hasFullContent = hasText && hasMedia;

        // build title widget
        final Widget titleWidget = hasTitle
            ? Container(
                child: H1(
                    text: block.title, textAlign: textAlign, selectable: true))
            : const SizedBox.shrink();

        // build desc widget (if needed)
        final Widget descWidget = hasDesc
            ? Container(
                child:
                    P(text: block.desc, textAlign: textAlign, selectable: true))
            : const SizedBox.shrink();

        // text spacer
        final Widget textSpacer = hasText
            ? const SizedBox(width: Design.SPACE, height: Design.SPACE)
            : const SizedBox.shrink();

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

        // build video widget
        final Widget videoWidget = hasVideo
            ? VideoBox(
                width: width,
                video: block.video,
                cinemaEnabledVN: this.widget.cinemaEnabledVN)
            : const SizedBox.shrink();

        // build image widget (if needed)

        // value notifier for the current in view block image (for multi images)
        final ValueNotifier<int> blockImageIndexVN = ValueNotifier(0);

        // add timer to switch between image indexes
        if (hasMultiImages) {
          timers.add(Timer.periodic(
              Design.STUDY_CONTENT_IMAGE_TRANSTION_ANIMATION_DURATION, (t) {
            // increment
            blockImageIndexVN.value =
                (blockImageIndexVN.value + 1) % block.images.length;
          }));
        }

        // build image widget (if needed)
        final Widget imageWidget = hasImage
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
                                      vsync: this))))
              ])
            : const SizedBox.shrink();

        // media widget
        final Widget mediaWidget = hasVideo ? videoWidget : imageWidget;

        // build space widget (if needed)
        final Widget blockSpacer = hasFullContent
            ? const SizedBox(width: Design.SPACE, height: Design.SPACE)
            : const SizedBox.shrink();

        // calculate width split (for rows)
        final double widthRowSplit = (width / 2) - (Design.SPACE / 2);

        // text width for the row
        final Widget textWidgetForRow = hasFullContent
            ? Container(width: widthRowSplit, child: textWidget)
            : hasText
                ? Container(width: width, child: textWidget)
                : textWidget;

        // video widget for the row
        final Widget videoWidgetForRow = hasFullContent
            ? Container(width: widthRowSplit, child: videoWidget)
            : hasVideo
                ? Container(width: width, child: videoWidget)
                : videoWidget;

        // image widget for the row
        final Widget imageWidgetForRow = hasFullContent
            ? Container(width: widthRowSplit, child: imageWidget)
            : hasImage
                ? Container(width: width, child: imageWidget)
                : imageWidget;

        // media widget for row
        final Widget mediaWidgetForRow =
            hasVideo ? videoWidgetForRow : imageWidgetForRow;

        // figure out text align vertical
        CrossAxisAlignment textAlignY = CrossAxisAlignment.start;
        if (block.textAlignY == 'CENTER' || block.textAlignY == 'center')
          textAlignY = CrossAxisAlignment.center;
        if (block.textAlignY == 'END' || block.textAlignY == 'end')
          textAlignY = CrossAxisAlignment.end;

        // LEFT
        Widget w = Row(
            crossAxisAlignment: textAlignY,
            children: [textWidgetForRow, blockSpacer, mediaWidgetForRow]);

        // TOP
        if (block.textPosition == 'TOP')
          w = Column(
              crossAxisAlignment: textAlignX,
              children: [textWidget, blockSpacer, mediaWidget]);

        // RIGHT
        if (block.textPosition == 'RIGHT')
          w = Row(
              crossAxisAlignment: textAlignY,
              children: [mediaWidgetForRow, blockSpacer, textWidgetForRow]);

        // BOTTOM
        if (block.textPosition == 'BOTTOM')
          w = Column(
              crossAxisAlignment: textAlignX,
              children: [mediaWidget, blockSpacer, textWidget]);

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
                    // color:
                    //     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    //         .withOpacity(1.0),
                    width: width,
                    child: w)));
      }
    }

    // CONTAINER
    return Container(
        // SCREEN WIDTH
        width: Design.screenWidth(context),
        // BACKGROUND COLOR
        color: widget.letter == 'A'
            ? Design.STUDY_CONTENT_BLOCKS_A_BACKGROUND_COLOR
            : Design.STUDY_CONTENT_BLOCKS_B_BACKGROUND_COLOR,
        // VERTICAL PADDING
        padding: EdgeInsets.symmetric(vertical: Design.gap(context)),
        // WRAP
        child: Wrap(
            //
            alignment: Design.STUDY_CONTENT_BLOCKS_ALIGNMENT,
            //
            runAlignment: Design.STUDY_CONTENT_BLOCKS_RUN_ALIGNMENT,
            // position elements vertically in center
            crossAxisAlignment: Design.STUDY_CONTENT_BLOCKS_CROSS_ALIGNMENT,
            // elements
            children: elements));
  }
}
