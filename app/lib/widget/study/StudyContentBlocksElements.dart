import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/Video.dart';
import 'package:app/widget/study/StudyBlockCache.dart';
import 'package:flutter/material.dart';

@deprecated
class StudyContentBlocksElements extends StatefulWidget {
  const StudyContentBlocksElements(
      {Key key, @required this.blocks, @required this.cinemaEnabledVN})
      : super(key: key);

  final List<ProjectStudyBlock> blocks;
  final ValueNotifier<Video> cinemaEnabledVN;

  @override
  StudyContentBlocksElementsState createState() =>
      StudyContentBlocksElementsState();
}

@deprecated
class StudyContentBlocksElementsState extends State<StudyContentBlocksElements>
    with TickerProviderStateMixin {
  @override
  void dispose() {
    print('StudyContentBlocksElements.dispose');
    super.dispose();

    // clear gif controllers
    Images.disposeGifControllers(this);
  }

  @override
  Widget build(BuildContext context) {
    print('StudyContentBlocksElements.build');

    StudyBlockCache studyBlockCache = StudyBlockCache(
        context: context,
        blocks: widget.blocks,
        cinemaEnabledVN: widget.cinemaEnabledVN,
        vsync: this);

    // WRAP
    return Wrap(
        //
        alignment: Design.STUDY_CONTENT_BLOCKS_ALIGNMENT,
        //
        runAlignment: Design.STUDY_CONTENT_BLOCKS_RUN_ALIGNMENT,
        // position elements vertically in center
        crossAxisAlignment: Design.STUDY_CONTENT_BLOCKS_CROSS_ALIGNMENT,
        // elements
        children: studyBlockCache.elements());
  }
}
