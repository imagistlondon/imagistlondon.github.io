import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.keyProjects,
      @required this.projectEnabledVN,
      @required this.projectKeysEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;

  final Map<String, Project> keyProjects;
  final ValueNotifier<Project> projectEnabledVN;
  final Map<String, ValueNotifier<bool>> projectKeysEnabledVN;

  void onTap() {
    studyEnabledVN.value = projectEnabledVN.value;
  }

  @override
  Widget build(BuildContext context) {
    // height
    final double height = MediaQuery.of(context).size.height -
        // HEADER HEIGHT
        (Design.clearance(context) +
            // MENU HEIGHT
            (Break.x12(context) ? Design.SPACE * 4 : 0));

    // init elements in stack
    final List<Widget> elements = List();

    // loop through project
    keyProjects.forEach((key, project) {
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
                  child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(project.imageThumb),
                      width: double.infinity,
                      height: height))));
    });

    // UA
    return UA(
        onTap: onTap,
        // STACK
        child: Stack(children: elements));
  }
}
