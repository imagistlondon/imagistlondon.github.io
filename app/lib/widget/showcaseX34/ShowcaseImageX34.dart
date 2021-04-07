import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:flutter/material.dart';

class ShowcaseImageX34 extends StatefulWidget {
  const ShowcaseImageX34(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  @override
  ShowcaseImageX34State createState() => ShowcaseImageX34State();
}

class ShowcaseImageX34State extends State<ShowcaseImageX34>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<int> hoverIndexVN = ValueNotifier(null);

  @override
  void dispose() {
    super.dispose();
    Images.disposeGifControllers(this);
  }

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
        child: L1(widget.projectEnabledVN, (Project projectEnabled) {
          // image
          final String image =
              projectEnabled != null ? projectEnabled.showcaseImage : null;

          // skip
          if (image == null) return SizedBox.shrink();

          // IMAGE
          return Images.of(image,
              height: height,
              fit: BoxFit.cover,
              gifDuration: projectEnabled.showcaseImageGifDuration,
              vsync: this);
        }));
  }
}
