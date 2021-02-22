import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:app/widget/archive/ArchiveLink.dart';
import 'package:flutter/material.dart';

class ArchiveMenu extends StatelessWidget {
  const ArchiveMenu({
    Key key,
    @required this.indexVN,
    @required this.studyEnabledVN,
    @required this.projectEnabledVN,
  }) : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {
    projectEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // PADDING
        padding: EdgeInsets.symmetric(horizontal: Design.gap(context)),
        // UA
        child: UA(
            onEnter: onEnter,
            onExit: onExit,
            // LINKS
            child: Column(children: <Widget>[
              for (int i = 0; i < Content.data.ARCHIVE_PROJECTS.length; i++)
                ArchiveLink(
                    indexVN: indexVN,
                    studyEnabledVN: studyEnabledVN,
                    projectEnabledVN: projectEnabledVN,
                    project: Content.data.ARCHIVE_PROJECTS[i],
                    first: i == 0)
            ])));
  }
}
