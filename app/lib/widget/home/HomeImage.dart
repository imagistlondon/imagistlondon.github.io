import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class HomeImage extends StatefulWidget {
  const HomeImage(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN,
      @required this.projectKeysEnabledVN,
      @required this.moveProject})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;

  final ValueNotifier<Project> projectEnabledVN;
  final Map<String, ValueNotifier<bool>> projectKeysEnabledVN;

  final Function moveProject;

  @override
  HomeImageState createState() => HomeImageState();
}

class HomeImageState extends State<HomeImage> with TickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    Images.disposeGifControllers(this);
  }

  void onTap() {
    widget.studyEnabledVN.value = widget.projectEnabledVN.value;
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
    final List<Widget> elements = [];

    // loop through project
    Content.data.KEY_HOME_PROJECTS.forEach((key, Project project) {
      // LISTEN
      elements.add(L1(
          widget.projectKeysEnabledVN[key],
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
                  child: Images.of(project.homeImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: height,
                      gifDuration: project.homeImageGifDuration,
                      vsync: this))));
    });

    // need at least 1 element so Stack can 'size' itself
    if (elements.isEmpty) elements.add(SizedBox(width: Design.SPACE));

    // UA
    return UA(
        onTap: onTap,
        onPanUpdate: (details) {
          print('details.delta: ' + details.delta.toString());
          if (details.delta.dx < -Design.SWIPE_THRESHOLD) {
            print('swiped-left');
            widget.moveProject();
          } else if (details.delta.dx > Design.SWIPE_THRESHOLD) {
            print('swiped-right');
            widget.moveProject();
          } else if (details.delta.dy > Design.SWIPE_THRESHOLD) {
            print('swiped-down');
            widget.moveProject();
          } else if (details.delta.dy < -Design.SWIPE_THRESHOLD) {
            print('swiped-up');
            widget.moveProject();
          }
        },
        // STACK
        child: Stack(children: elements));
  }
}
