import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/header/HeaderBulletLinksX1.dart';
import 'package:app/widget/showcaseX12/ShowcaseImageX12.dart';
import 'package:app/widget/showcaseX12/ShowcaseLinkX12.dart';
import 'package:flutter/material.dart';

class ShowcaseX12 extends StatelessWidget {
  const ShowcaseX12(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;
  final StudyEnabledNotifier studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // HEADER CLEARANCE
    final SizedBox clearance = SizedBox(height: Design.clearance(context));

    // LISTEN
    return L1(
        indexVN,
        (index) => Visibility(
            visible: index == Index.WORK_SHOWCASE,
            child:
                // SCROLL
                SingleChildScrollView(
                    child: Column(children: <Widget>[
              // HEADER CLEARANCE
              clearance,
              // HEADER BULLETS X1
              Break.x1(context)
                  ? HeaderBulletLinksX1(
                      indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
                  : SizedBox.shrink(),
              // PROJECTS
              for (final Project project in contentVN.value.SHOWCASE_PROJECTS)
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // IMAGE
                      ShowcaseImageX12(
                          indexVN: indexVN,
                          studyEnabledVN: studyEnabledVN,
                          project: project),
                      // TITLE
                      ShowcaseLinkX12(
                          indexVN: indexVN,
                          studyEnabledVN: studyEnabledVN,
                          project: project)
                    ])
            ]))));
  }
}
