import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/widget/archive/Archive.dart';
import 'package:app/widget/header/HeaderX1.dart';
import 'package:app/widget/header/HeaderX234.dart';
import 'package:app/widget/home/Home.dart';
import 'package:app/widget/Loading.dart';
import 'package:app/widget/ProgressBar.dart';
import 'package:app/widget/showcaseX34/ShowcaseX34.dart';
import 'package:app/widget/showcaseX12/ShowcaseX12.dart';
import 'package:app/widget/studio/Studio.dart';
import 'package:app/widget/study/Study.dart';
import 'package:app/widget/tags/Tags.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({Key key, @required this.contentVN}) : super(key: key);

  final ValueNotifier<Content> contentVN;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  // page indexes
  final ValueNotifier<Index> indexVN = ValueNotifier(Index.HOME);

  // header bullets showing
  final ValueNotifier<bool> bulletsEnabledVN = ValueNotifier(false);

  // study project
  final ValueNotifier<Project> studyEnabledVN = ValueNotifier(null);

  // showing studio
  final ValueNotifier<bool> studioEnabledVN = ValueNotifier(false);

  // showing loading page
  final ValueNotifier<bool> loadingEnabledVN = ValueNotifier(false);

  // progress bar fraction
  final ValueNotifier<double> progressFractionVN = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        // BACKGROUND COLOR
        color: Design.BACKGROUND_COLOR,
        // STACK
        child: Stack(children: <Widget>[
          // HOME (underneath header as it does not reach it all)
          Home(
            contentVN: widget.contentVN,
            indexVN: indexVN,
            studyEnabledVN: studyEnabledVN,
            studioEnabledVN: studioEnabledVN,
          ),

          // ARCHIVE (underneath header as it scrolls behind header)
          Archive(
              contentVN: widget.contentVN,
              indexVN: indexVN,
              studyEnabledVN: studyEnabledVN),

          // TAGS (underneath header as it scrolls behind header)
          Tags(
              contentVN: widget.contentVN,
              indexVN: indexVN,
              studyEnabledVN: studyEnabledVN),

          // SHOWCASE-X12
          if (Break.x12(context))
            ShowcaseX12(
                contentVN: widget.contentVN,
                indexVN: indexVN,
                studyEnabledVN: studyEnabledVN),

          // HEADER
          Break.x1(context)
              ? HeaderX1(
                  contentVN: widget.contentVN,
                  indexVN: indexVN,
                  bulletsEnabledVN: bulletsEnabledVN,
                  studioEnabledVN: studioEnabledVN)
              : HeaderX234(
                  contentVN: widget.contentVN,
                  indexVN: indexVN,
                  bulletsEnabledVN: bulletsEnabledVN,
                  studioEnabledVN: studioEnabledVN),

          // SHOWCASE-X34 (ontop of header because of right 50% image)
          if (Break.x34(context))
            ShowcaseX34(
              contentVN: widget.contentVN,
              indexVN: indexVN,
              studyEnabledVN: studyEnabledVN,
            ),

          // STUDY
          Study(indexVN: indexVN, studyEnabledVN: studyEnabledVN),

          // STUDIO
          Studio(contentVN: widget.contentVN, studioEnabledVN: studioEnabledVN),

          // // LOADING
          // Loading(enabledVN: loadingEnabledVN),

          // // PROGRESS BAR
          // ProgressBar(
          //     position: progressFraction,
          //     max: MediaQuery.of(context).size.width)
        ]));
  }
}
