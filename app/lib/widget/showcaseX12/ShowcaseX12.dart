import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Browsers.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/header/HeaderBulletLinksX1.dart';
import 'package:app/widget/showcaseX12/ShowcaseImageX12.dart';
import 'package:app/widget/showcaseX12/ShowcaseLinkMX12.dart';
import 'package:app/widget/showcaseX12/ShowcaseLinkX12.dart';
import 'package:flutter/material.dart';

class ShowcaseX12 extends StatelessWidget {
  const ShowcaseX12(
      {Key key,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studyEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;
  final StudyEnabledNotifier studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    print('Showcasex12.build');

    // HEADER CLEARANCE
    final SizedBox clearance = SizedBox(height: Design.clearance(context));

    // HEADER BULLETS X1
    final Widget bulletsX1 = Break.x1(context)
        ? HeaderBulletLinksX1(
            indexVN: indexVN, bulletsEnabledVN: bulletsEnabledVN)
        : SizedBox.shrink();

    // image padding
    final EdgeInsetsGeometry imagePadding =
        EdgeInsets.only(left: Design.gap(context));

    // image width
    final double imageWidth =
        MediaQuery.of(context).size.width - Design.gap(context);

    // image height
    final double imageHeight = imageWidth * (9 / 16);

    // calculate link padding
    final EdgeInsets linkPadding = EdgeInsets.all(Design.gap(context));

    // PROJECTS
    final List<Widget> projects = [];
    for (final Project project in Content.data.SHOWCASE_PROJECTS) {
      projects.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // IMAGE
            ShowcaseImageX12(
                studyEnabledVN: studyEnabledVN,
                project: project,
                width: imageWidth,
                height: imageHeight,
                padding: imagePadding),
            // TITLE
            Browsers.MOBILE
                ? ShowcaseLinkMX12(
                    studyEnabledVN: studyEnabledVN,
                    project: project,
                    padding: linkPadding)
                : ShowcaseLinkX12(
                    studyEnabledVN: studyEnabledVN,
                    project: project,
                    padding: linkPadding)
          ]));
    }

    final Widget scroll = ListView(children: <Widget>[
      // HEADER CLEARANCE
      clearance,
      // HEADER BULLETS X1
      bulletsX1,
      // PROJECTS
      ...projects
    ]);

    // LISTEN
    return L1(
        indexVN,
        (index) =>
            Visibility(visible: index == Index.WORK_SHOWCASE, child: scroll));
  }
}
