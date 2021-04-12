import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/Video.dart';
import 'package:app/widget/study/StudyBlockCache.dart';
import 'package:app/widget/study/StudyContentBlocks.dart';
import 'package:app/widget/study/StudyContentIntroX1.dart';
import 'package:app/widget/study/StudyContentIntroX234.dart';
import 'package:app/widget/study/StudyContentThumb.dart';
import 'package:flutter/material.dart';

class StudyContent extends StatefulWidget {
  const StudyContent(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.d_studyEnabledVN,
      @required this.cinemaEnabledVN,
      @required this.scrollController})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;
  final ValueNotifier<Video> cinemaEnabledVN;
  final ScrollController scrollController;

  @override
  StudyContentState createState() => StudyContentState();
}

class StudyContentState extends State<StudyContent>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    print('StudyContent.dispose');
    super.dispose();

    // clear gif controllers
    Images.disposeGifControllers(this);
  }

  @override
  Widget build(BuildContext context) {
    print('StudyContent.build');

    return L1(widget.d_studyEnabledVN, (Project project) {
      if (project == null) return const SizedBox.shrink();

      StudyBlockCache studyBlockCacheA = StudyBlockCache(
          context: context,
          blocks: project.studyBlocks['A'],
          cinemaEnabledVN: widget.cinemaEnabledVN,
          vsync: this);

      StudyBlockCache studyBlockCacheB = StudyBlockCache(
          context: context,
          blocks: project.studyBlocks['B'],
          cinemaEnabledVN: widget.cinemaEnabledVN,
          vsync: this);

      final int gridBlocksSizeA = studyBlockCacheA.gridBlocksSize();
      final int gridBlocksSizeB = studyBlockCacheB.gridBlocksSize();

      final int gridBlocksStartA = 2;
      final int gridBlocksEndA = gridBlocksStartA + gridBlocksSizeA - 1;

      final int gridBlocksStartB = gridBlocksEndA + 1;
      final int gridBlocksEndB = gridBlocksStartB + gridBlocksSizeB - 1;

      print('StudyContent.gridBlocksSizeA.' + gridBlocksSizeA.toString());
      print('StudyContent.gridBlocksSizeB.' + gridBlocksSizeB.toString());

      print('StudyContent.gridBlocksStartA.' + gridBlocksStartA.toString());
      print('StudyContent.gridBlocksEndA.' + gridBlocksEndA.toString());

      print('StudyContent.gridBlocksStartB.' + gridBlocksStartB.toString());
      print('StudyContent.gridBlocksEndB.' + gridBlocksEndB.toString());

      final int itemCount = 2 + gridBlocksSizeA + gridBlocksSizeB;

      print('StudyContent.itemCount.' + itemCount.toString());

      // SCROLL
      return Scrollbar(
          controller: widget.scrollController,
          isAlwaysShown: true,
          child: ListView.builder(
              // CONTROLLER
              controller: widget.scrollController,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                print('StudyContent.itemBuilder.index.' + index.toString());
                // StudyContentThumb
                if (index == 0)
                  return StudyContentThumb(
                      studyEnabledVN: widget.studyEnabledVN,
                      d_studyEnabledVN: widget.d_studyEnabledVN);

                // StudyContentIntro
                else if (index == 1)
                  return Break.x1(context)
                      ? StudyContentIntroX1(
                          studyEnabledVN: widget.studyEnabledVN,
                          d_studyEnabledVN: widget.d_studyEnabledVN)
                      : StudyContentIntroX234(
                          studyEnabledVN: widget.studyEnabledVN,
                          d_studyEnabledVN: widget.d_studyEnabledVN);

                // BlocksA
                else if (index >= gridBlocksStartA && index <= gridBlocksEndA)
                  return studyBlockCacheA.rowContainer(
                      context,
                      index - gridBlocksStartA,
                      Design.STUDY_CONTENT_BLOCKS_BACKGROUND_COLOR['A']);

                // BlocksB
                else if (index >= gridBlocksStartB && index <= gridBlocksEndB)
                  return studyBlockCacheB.rowContainer(
                      context,
                      index - gridBlocksStartB,
                      Design.STUDY_CONTENT_BLOCKS_BACKGROUND_COLOR['B']);

                // out of bounds
                else {
                  print('StudyContent.itemBuilder.outOfBounds.' +
                      index.toString());
                  return const SizedBox.shrink();
                }

                // // StudyContentBlocks (A)
                // else if (index == 2)
                //   return StudyContentBlocks(
                //       studyEnabledVN: widget.studyEnabledVN,
                //       d_studyEnabledVN: widget.d_studyEnabledVN,
                //       cinemaEnabledVN: widget.cinemaEnabledVN,
                //       letter: 'A');

                // // StudyContentBlocks (B)
                // else if (index == 3)
                //   return StudyContentBlocks(
                //       studyEnabledVN: widget.studyEnabledVN,
                //       cinemaEnabledVN: widget.cinemaEnabledVN,
                //       d_studyEnabledVN: widget.d_studyEnabledVN,
                //       letter: 'B');
              }));
    });
  }
}
