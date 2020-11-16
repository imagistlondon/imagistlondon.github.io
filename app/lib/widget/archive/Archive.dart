import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1.dart';
import 'package:app/widget/archive/ArchiveImage.dart';
import 'package:app/widget/archive/ArchiveMenu.dart';
import 'package:flutter/material.dart';

class Archive extends StatefulWidget {
  const Archive(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;

  @override
  ArchiveState createState() => ArchiveState();
}

class ArchiveState extends State<Archive> {
  // current project enabled
  final ValueNotifier<Project> projectEnabledVN = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    // header/footer spacing
    final SizedBox spacing =
        SizedBox(height: Design.clearance(context, bulletsOpen: true));

    // LISTEN
    return L1(
        widget.indexVN,
        (index) => Visibility(
            visible: index == Index.WORK_ARCHIVE,
            // SCROLLABLE
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              // HEADER SPACING
              spacing,
              // STACK
              Stack(children: <Widget>[
                // NONE
                if (widget.contentVN.value.ARCHIVE_PROJECTS.isEmpty)
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Design.gap(context)),
                      child: const P(text: 'No projects found.')),

                // MENU
                ArchiveMenu(
                    contentVN: widget.contentVN,
                    indexVN: widget.indexVN,
                    studyEnabledVN: widget.studyEnabledVN,
                    projectEnabledVN: projectEnabledVN),

                // IMAGE
                if (Break.x234(context))
                  ArchiveImage(
                      contentVN: widget.contentVN,
                      indexVN: widget.indexVN,
                      studyEnabledVN: widget.studyEnabledVN,
                      projectEnabledVN: projectEnabledVN)
              ]),
              // FOOTER SPACING
              spacing
            ]))));
  }
}
