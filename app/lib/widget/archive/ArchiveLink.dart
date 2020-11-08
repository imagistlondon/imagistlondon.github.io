import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/Project.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ArchiveLink extends StatefulWidget {
  const ArchiveLink(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN,
      @required this.project,
      this.first = false})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;
  final Project project;
  final bool first;

  @override
  ArchiveLinkState createState() => ArchiveLinkState();
}

class ArchiveLinkState extends State<ArchiveLink> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  // row border
  static const BorderSide border = BorderSide(
      width: Design.ARCHIVE_MENU_LINK_BORDER_WIDTH,
      color: Design.ARCHIVE_MENU_LINK_BORDER_COLOR);

  // row filler border
  static const BorderSide borderFiller = BorderSide(
      width: Design.ARCHIVE_MENU_LINK_BORDER_WIDTH, color: Colors.transparent);

  void onTap() {
    widget.studyEnabledVN.value = widget.project;
  }

  void onEnter(PointerEvent pe) {
    hoverVN.value = true;
    widget.projectEnabledVN.value = widget.project;
  }

  void onExit(PointerEvent pe) {
    hoverVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // UA
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // LISTEN (hoverVN)
        child: L1C(
            hoverVN,
            (hover, child) => Container(

                // DECORATION
                decoration: BoxDecoration(
                    // OPACITY
                    color: Design.ARCHIVE_MENU_LINK_HOVER_BACKGROUND_COLOR
                        .withOpacity(hover
                            ? Design.ARCHIVE_MENU_LINK_HOVER_BACKGROUND_COLOR
                                .opacity
                            : 0),
                    // BORDER
                    border: Border(
                        // TOP
                        top: widget.first ? border : borderFiller,
                        // BOTTOM
                        bottom: border)),
                // CHILD
                child: child),

            // ROW
            child: Container(
                // HEIGHT
                height: Design.ARCHIVE_MENU_ROW_HEIGHT,
                // ROW
                child: Row(children: <Widget>[
                  // TITLE
                  Expanded(
                      flex: Break.x1(context) ? 4 : 3,
                      child: P(text: widget.project.title)),

                  // SUBTITLE
                  Expanded(
                      flex: Break.x1(context) ? 6 : 4,
                      child: P(text: widget.project.subtitle)),

                  // YEAR
                  Expanded(
                      flex: Break.x1(context) ? 2 : 5,
                      child: P(text: widget.project.year)),
                ]))));
  }
}
