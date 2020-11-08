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
      @required this.projectEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  void onTap() {
    studyEnabledVN.value = projectEnabledVN.value;
  }

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L1(projectEnabledVN, (projectEnabled) {
      // skip
      if (projectEnabled == null) return SizedBox.shrink();

      // image
      final String image =
          projectEnabled != null ? projectEnabled.imageThumb : null;

      // height
      final double height = MediaQuery.of(context).size.height -
          // HEADER HEIGHT
          (Design.clearance(context) +
              // MENU HEIGHT
              (Break.x12(context) ? Design.SPACE * 4 : 0));

      // IMAGE
      return UA(
          onTap: onTap,
          child: Image(
              fit: BoxFit.cover,
              image: AssetImage(image),
              width: double.infinity,
              height: height));
    });
  }
}
