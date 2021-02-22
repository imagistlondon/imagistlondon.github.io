import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN,
      @required this.projectKeysEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;

  final ValueNotifier<Project> projectEnabledVN;
  final Map<String, ValueNotifier<bool>> projectKeysEnabledVN;

  void onTap() {
    studyEnabledVN.value = projectEnabledVN.value;
  }

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    // init elements in stack
    final List<Widget> elements = List();

    // loop through project
    Content.data.KEY_HOME_PROJECTS.forEach((key, project) {
      // LISTEN
      elements.add(L1(
          projectKeysEnabledVN[key],
          (enabled) =>
              // ANIMATED OPACITY
              AnimatedOpacity(
                  // duration
                  duration: Design.HOME_OPACITY_ANIMATION_DURATION,
                  // curve
                  curve: Design.HOME_OPACITY_ANIMATION_CURVE,
                  // opacity
                  opacity: enabled ? 1 : 0,
                  // IMAGE
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // TITLE
                        P(text: project.title),
                        // SUBTITLE
                        P(
                          text: project.subtitle,
                          style:
                              TextStyle(color: Design.HOME_MENU_SUBTITLE_COLOR),
                        ),
                      ]))));
    });

    // need at least 1 element so Stack can 'size' itself
    if (elements.isEmpty) elements.add(SizedBox(width: Design.SPACE));

    // UA
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // CONTAINER
        child: Container(
            // HEIGHT
            height: Design.SPACE * 4,
            // STACK
            child: Stack(children: elements)));
  }
}
