import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/Video.dart';
import 'package:app/widget/study/StudyContentBlocksElements.dart';
import 'package:flutter/material.dart';

@deprecated
class StudyContentBlocks extends StatelessWidget {
  const StudyContentBlocks(
      {Key key,
      @required this.studyEnabledVN,
      @required this.d_studyEnabledVN,
      @required this.cinemaEnabledVN,
      @required this.letter})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final StudyEnabledNotifier d_studyEnabledVN;
  final ValueNotifier<Video> cinemaEnabledVN;
  final String letter;

  // shrink
  static const SHRINK = const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    print('StudyContentBlocks.build.' + letter);

    // CONTAINER
    return Container(
        // SCREEN WIDTH
        width: Design.screenWidth(context),
        // BACKGROUND COLOR
        color: Design.STUDY_CONTENT_BLOCKS_BACKGROUND_COLOR[letter],
        // VERTICAL PADDING
        padding: EdgeInsets.symmetric(vertical: Design.gap(context)),
        // L1 (d_studyEnabledVN)
        child: L1(
            d_studyEnabledVN,
            (Project project) => project != null
                // StudyContentBlocksElements (WRAP)
                ? StudyContentBlocksElements(
                    blocks: project.studyBlocks[letter],
                    cinemaEnabledVN: cinemaEnabledVN)
                : SHRINK));
  }
}
