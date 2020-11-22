import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  void onTap() {
    studyEnabledVN.value = projectEnabledVN.value;
  }

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // CONTAINER
        child: Container(
            // HEIGHT
            height: Design.SPACE * 4,
            // LISTENER (projectEnabledVN)
            child: L1(
                projectEnabledVN,
                (projectEnabled) =>
                    // SKIP
                    projectEnabled == null
                        ? SizedBox.shrink()
                        // COLUMN
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                // TITLE
                                P(text: projectEnabled.title),
                                // SUBTITLE
                                P(
                                  text: projectEnabled.subtitle,
                                  style: TextStyle(
                                      color: Design.HOME_MENU_SUBTITLE_COLOR),
                                ),
                              ]))));
  }
}
