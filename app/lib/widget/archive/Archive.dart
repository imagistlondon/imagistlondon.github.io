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
      {Key key, @required this.indexVN, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;

  @override
  ArchiveState createState() => ArchiveState();
}

class ArchiveState extends State<Archive> {
  // current project enabled
  final ValueNotifier<Project> projectEnabledVN = ValueNotifier(null);

  // projects
  static final List<Project> projects =
      Content.PROJECTS.where((p) => p.archive == true).toList();

  // int range
  static final List<int> range = List.generate(projects.length, (i) => i);

  // map key -> index
  static final Map<String, int> projectKeyToIndex =
      Map.fromIterable(range, key: (i) => projects[i].key, value: (i) => i);

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
                if (projects.isEmpty)
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: Design.gap(context)),
                      child: const P(text: 'No projects found.')),

                // MENU
                ArchiveMenu(
                    indexVN: widget.indexVN,
                    studyEnabledVN: widget.studyEnabledVN,
                    projectEnabledVN: projectEnabledVN,
                    projects: projects),

                // IMAGE
                if (Break.x234(context))
                  ArchiveImage(
                      indexVN: widget.indexVN,
                      studyEnabledVN: widget.studyEnabledVN,
                      projectEnabledVN: projectEnabledVN,
                      projects: projects,
                      projectKeyToIndex: projectKeyToIndex)
              ]),
              // FOOTER SPACING
              spacing
            ]))));
  }
}
