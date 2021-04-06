import 'package:app/config/Design.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ShowcaseImageX12 extends StatelessWidget {
  const ShowcaseImageX12(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.project})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final Project project;

  void onTap() {
    studyEnabledVN.value = project;
  }

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    // skip
    if (project.showcaseImage == null) return SizedBox.shrink();

    // width
    final double width =
        MediaQuery.of(context).size.width - Design.gap(context);

    // height
    final double height = width * (9 / 16);

    // padding
    final EdgeInsetsGeometry padding =
        EdgeInsets.only(left: Design.gap(context));

    // TAP
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // CONTAINER
        child: Container(
            padding: padding,
            child: Images.of(project.showcaseImage,
                fit: BoxFit.cover, width: width, height: height)));
  }
}
