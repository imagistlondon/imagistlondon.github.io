import 'dart:async';

import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:app/widget/home/HomeImage.dart';
import 'package:app/widget/home/HomeMenu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<bool> studioEnabledVN;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // projects
  static final List<Project> projects =
      Content.PROJECTS.where((p) => p.home == true).toList();

  // map key -> project
  static final Map<String, Project> keyProjects =
      Map.fromIterable(projects, key: (p) => p.key, value: (p) => p);

  // current project enabled
  final ValueNotifier<Project> projectEnabledVN = ValueNotifier(projects[0]);

  // project index enabled
  final ValueNotifier<int> projectIndexEnabledVN = ValueNotifier(0);

  // map projectKey -> projectEnabled flag
  final Map<String, ValueNotifier<bool>> projectKeysEnabledVN =
      Map.fromIterable(projects,
          key: (p) => p.key, value: (p) => ValueNotifier(false));

  // ticket to switch projects
  Timer timer;

  @override
  void initState() {
    super.initState();

    // init first to be true
    projectKeysEnabledVN[projects[0].key].value = true;

    // timer
    timer = Timer.periodic(Design.HOME_TRANSTION_ANIMATION_DURATION, (t) {
      // skip if studio enabled
      if (widget.studioEnabledVN.value) return;

      // disable old project
      projectKeysEnabledVN[projectEnabledVN.value.key].value = false;

      // update index
      projectIndexEnabledVN.value =
          (projectIndexEnabledVN.value + 1) % projects.length;

      // update project
      projectEnabledVN.value = projects[projectIndexEnabledVN.value];

      // enable new project
      projectKeysEnabledVN[projectEnabledVN.value.key].value = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L1(
        widget.indexVN,
        (index) => Visibility(
            visible: index == Index.HOME,
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(children: <Widget>[
                  // VERTICAL SPACING
                  SizedBox(height: Design.clearance(context)),

                  // CONTAINER
                  Container(
                      // LEFT MARGIN
                      padding: EdgeInsets.only(left: Design.gap(context)),

                      // BREAK
                      child: Break.x12(context)
                          ?
                          // X12
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  // MENU
                                  HomeMenu(
                                      indexVN: widget.indexVN,
                                      studyEnabledVN: widget.studyEnabledVN,
                                      projectEnabledVN: projectEnabledVN),

                                  // IMAGE
                                  HomeImage(
                                      indexVN: widget.indexVN,
                                      studyEnabledVN: widget.studyEnabledVN,
                                      keyProjects: keyProjects,
                                      projectEnabledVN: projectEnabledVN,
                                      projectKeysEnabledVN:
                                          projectKeysEnabledVN)
                                ])
                          :
                          // X34
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  // MENU
                                  Expanded(
                                      flex: 3,
                                      child: HomeMenu(
                                          indexVN: widget.indexVN,
                                          studyEnabledVN: widget.studyEnabledVN,
                                          projectEnabledVN: projectEnabledVN)),

                                  // IMAGE
                                  Expanded(
                                      flex: 9,
                                      child: HomeImage(
                                          indexVN: widget.indexVN,
                                          studyEnabledVN: widget.studyEnabledVN,
                                          keyProjects: keyProjects,
                                          projectEnabledVN: projectEnabledVN,
                                          projectKeysEnabledVN:
                                              projectKeysEnabledVN))
                                ]))
                ]))));
  }
}
