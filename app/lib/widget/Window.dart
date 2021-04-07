import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/archive/Archive.dart';
import 'package:app/widget/header/HeaderX1.dart';
import 'package:app/widget/header/HeaderX234.dart';
import 'package:app/widget/home/Home.dart';
import 'package:app/widget/logo/LogoX1.dart';
import 'package:app/widget/logo/LogoX234.dart';
import 'package:app/widget/showcaseX34/ShowcaseX34.dart';
import 'package:app/widget/showcaseX12/ShowcaseX12.dart';
import 'package:app/widget/studio/Studio.dart';
import 'package:app/widget/study/StudyGeneric.dart';
import 'package:app/widget/tags/Tags.dart';
import 'package:app/widget/terms/Terms.dart';
import 'package:flutter/material.dart';

class Window extends StatefulWidget {
  const Window(
      {Key key,
      @required this.drawCompleteVN,
      @required this.progressFractionVN,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studioEnabledVN,
      @required this.initStudyKey})
      : super(key: key);

  final ValueNotifier<bool> drawCompleteVN;
  final ValueNotifier<double> progressFractionVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;
  final ValueNotifier<bool> studioEnabledVN;
  final String initStudyKey;

  @override
  WindowState createState() => WindowState();
}

class WindowState extends State<Window> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('Window.postFrameCallback');
      widget.drawCompleteVN.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Window.build');

    // use the initial study key
    final StudyEnabledNotifier studyEnabledVN = StudyEnabledNotifier(
        widget.initStudyKey != null
            ? Content.data.KEY_PROJECTS[widget.initStudyKey]
            : null);

    // CONTAINER
    return Container(
        // BACKGROUND COLOR
        color: Design.BACKGROUND_COLOR,
        // STACK
        child: Stack(children: <Widget>[
          // HOME (underneath header as it does not reach it all)
          Home(
            indexVN: widget.indexVN,
            studyEnabledVN: studyEnabledVN,
            studioEnabledVN: widget.studioEnabledVN,
          ),

          // TERMS
          Terms(indexVN: widget.indexVN),

          // ARCHIVE (underneath header as it scrolls behind header)
          Archive(
              indexVN: widget.indexVN,
              bulletsEnabledVN: widget.bulletsEnabledVN,
              studyEnabledVN: studyEnabledVN),

          // TAGS (underneath header as it scrolls behind header)
          Tags(
              indexVN: widget.indexVN,
              bulletsEnabledVN: widget.bulletsEnabledVN,
              studyEnabledVN: studyEnabledVN),

          // SHOWCASE-X12
          if (Break.x12(context))
            ShowcaseX12(
                indexVN: widget.indexVN,
                bulletsEnabledVN: widget.bulletsEnabledVN,
                studyEnabledVN: studyEnabledVN),

          // HEADER
          Break.x1(context)
              ? HeaderX1(
                  indexVN: widget.indexVN,
                  bulletsEnabledVN: widget.bulletsEnabledVN,
                  studioEnabledVN: widget.studioEnabledVN)
              : HeaderX234(
                  indexVN: widget.indexVN,
                  bulletsEnabledVN: widget.bulletsEnabledVN,
                  studioEnabledVN: widget.studioEnabledVN),

          // SHOWCASE-X34 (ontop of header because of right 50% image)
          if (Break.x34(context))
            ShowcaseX34(
              indexVN: widget.indexVN,
              studyEnabledVN: studyEnabledVN,
            ),

          // LOGO
          Break.x1(context)
              ? LogoX1(
                  indexVN: widget.indexVN,
                  bulletsEnabledVN: widget.bulletsEnabledVN)
              : LogoX234(
                  indexVN: widget.indexVN,
                  bulletsEnabledVN: widget.bulletsEnabledVN),

          // STUDY
          // for (final Project project in Content.data.PROJECTS)
          //   if (project.home || project.showcase)
          //     Study(
          //         indexVN: widget.indexVN,
          //         studyEnabledVN: studyEnabledVN,
          //         progressFractionVN: widget.progressFractionVN,
          //         project: project),

          // STUDY (generic)
          StudyGeneric(
              indexVN: widget.indexVN,
              studyEnabledVN: studyEnabledVN,
              progressFractionVN: widget.progressFractionVN),

          // STUDIO
          Studio(
              indexVN: widget.indexVN, studioEnabledVN: widget.studioEnabledVN),
        ]));
  }
}
