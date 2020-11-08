import 'package:app/Index.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/Project.dart';
import 'package:flutter/material.dart';

class ShowcaseImageX34 extends StatelessWidget {
  const ShowcaseImageX34(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN})
      : super(key: key);

  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  @override
  Widget build(BuildContext context) {
    // width
    final double width = MediaQuery.of(context).size.width / 2;

    // height
    final double height = MediaQuery.of(context).size.height;

    // CONTAINER
    return Container(
        // 50% SCREEN (RIGHT)
        width: width,

        // LISTEN (projectEnabledVN)
        child: L1(projectEnabledVN, (projectEnabled) {
          // image
          final String image =
              projectEnabled != null ? projectEnabled.imageThumb : null;

          // skip
          if (image == null) return SizedBox.shrink();

          // IMAGE
          return Image(
              height: height, fit: BoxFit.cover, image: AssetImage(image));
        }));
  }
}
