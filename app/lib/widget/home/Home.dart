import 'dart:async';

import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/home/HomeImage.dart';
import 'package:app/widget/home/HomeMenu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<bool> studioEnabledVN;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // current project enabled
  ValueNotifier<Project> projectEnabledVN = ValueNotifier(null);

  // project index enabled
  final ValueNotifier<int> projectIndexEnabledVN = ValueNotifier(0);

  // map projectKey -> projectEnabled flag
  Map<String, ValueNotifier<bool>> projectKeysEnabledVN = Map();

  // ticket to switch projects
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // only if there are projects
    if (widget.contentVN.value.HOME_PROJECTS.length > 0) {
      // current project enabled
      projectEnabledVN = ValueNotifier(widget.contentVN.value.HOME_PROJECTS[0]);

      // map projectKey -> projectEnabled flag
      projectKeysEnabledVN = Map.fromIterable(
          widget.contentVN.value.HOME_PROJECTS,
          key: (p) => p.key,
          value: (p) => ValueNotifier(false));

      // init first to be true
      projectKeysEnabledVN[widget.contentVN.value.HOME_PROJECTS[0].key].value =
          true;

      // kill any previous timer
      if (timer != null) {
        timer.cancel();
        timer = null;
      }

      // timer
      timer = Timer.periodic(Design.HOME_TRANSTION_ANIMATION_DURATION, (t) {
        // skip if studio enabled
        if (widget.studioEnabledVN.value) return;

        // disable old project
        projectKeysEnabledVN[projectEnabledVN.value.key].value = false;

        // update index
        projectIndexEnabledVN.value = (projectIndexEnabledVN.value + 1) %
            widget.contentVN.value.HOME_PROJECTS.length;

        // update project
        projectEnabledVN.value =
            widget.contentVN.value.HOME_PROJECTS[projectIndexEnabledVN.value];

        // enable new project
        projectKeysEnabledVN[projectEnabledVN.value.key].value = true;
      });
    }

    // MENU
    final HomeMenu _HomeMenu = HomeMenu(
        indexVN: widget.indexVN,
        studyEnabledVN: widget.studyEnabledVN,
        projectEnabledVN: projectEnabledVN);

    // IMAGE
    final HomeImage _HomeImage = HomeImage(
        contentVN: widget.contentVN,
        indexVN: widget.indexVN,
        studyEnabledVN: widget.studyEnabledVN,
        projectEnabledVN: projectEnabledVN,
        projectKeysEnabledVN: projectKeysEnabledVN);

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
                          // X12
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[_HomeMenu, _HomeImage])
                          // X34
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Expanded(flex: 3, child: _HomeMenu),
                                  Expanded(flex: 9, child: _HomeImage)
                                ]))
                ]))));
  }
}
