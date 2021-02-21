import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
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
import 'package:app/widget/terms/Terms.dart';
import 'package:flutter/material.dart';

class Window extends StatefulWidget {
  const Window(
      {Key key,
      @required this.contentVN,
      @required this.loadingVN,
      @required this.progressFractionVN,
      @required this.initIndex,
      this.initStudyKey})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<bool> loadingVN;
  final ValueNotifier<double> progressFractionVN;
  final Index initIndex;
  final String initStudyKey;

  @override
  WindowState createState() => WindowState();
}

class WindowState extends State<Window> {
  // page indexes
  final IndexNotifier indexVN = IndexNotifier(Index.HOME);

  // header bullets showing
  final ValueNotifier<bool> bulletsEnabledVN = ValueNotifier(false);

  // study project
  final StudyEnabledNotifier studyEnabledVN = StudyEnabledNotifier(null);

  // showing studio
  final ValueNotifier<bool> studioEnabledVN = ValueNotifier(false);

  // showing loading
  final ValueNotifier<bool> loadingEnabledVN = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    indexVN.value = widget.initIndex;
    bulletsEnabledVN.value = widget.initIndex.isWork();
  }

  @override
  Widget build(BuildContext context) {
    // LISTEN (CONTENT)
    return L1(widget.contentVN, (content) {
      // use the initial study key
      if (widget.initStudyKey != null) {
        studyEnabledVN.value = content.KEY_PROJECTS[widget.initStudyKey];
      }

      // CONTAINER
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

            // TERMS
            Terms(contentVN: widget.contentVN, indexVN: indexVN),

            // ARCHIVE (underneath header as it scrolls behind header)
            Archive(
                contentVN: widget.contentVN,
                indexVN: indexVN,
                bulletsEnabledVN: bulletsEnabledVN,
                studyEnabledVN: studyEnabledVN),

            // TAGS (underneath header as it scrolls behind header)
            Tags(
                contentVN: widget.contentVN,
                indexVN: indexVN,
                bulletsEnabledVN: bulletsEnabledVN,
                studyEnabledVN: studyEnabledVN),

            // SHOWCASE-X12
            if (Break.x12(context))
              ShowcaseX12(
                  contentVN: widget.contentVN,
                  indexVN: indexVN,
                  bulletsEnabledVN: bulletsEnabledVN,
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
            Study(
                indexVN: indexVN,
                studyEnabledVN: studyEnabledVN,
                progressFractionVN: widget.progressFractionVN),

            // STUDIO
            Studio(
                contentVN: widget.contentVN,
                indexVN: indexVN,
                studioEnabledVN: studioEnabledVN),

            // LOADING
            Loading(
                contentVN: widget.contentVN,
                loadingVN: widget.loadingVN,
                loadingEnabledVN: loadingEnabledVN),

            // PROGRESS BAR
            ProgressBar(
                progressFractionVN: widget.progressFractionVN,
                max: MediaQuery.of(context).size.width)
          ]));
    });
  }
}
