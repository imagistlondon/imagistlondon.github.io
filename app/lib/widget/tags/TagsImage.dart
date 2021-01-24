import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class TagsImage extends StatelessWidget {
  const TagsImage(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.image})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final String image;

  void onTap() {
    final String projectKey = contentVN.value.TAG_IMAGE_TO_KEY[this.image];
    final Project project = contentVN.value.KEY_PROJECTS[projectKey];
    studyEnabledVN.value = project;
  }

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    // skip
    if (image == null) return SizedBox.shrink();

    // UA
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // IMAGE
        child: Image(
            fit: Design.TAGS_IMAGE_BOX_FIT,
            width: Break.decide(
                context,
                // x1 (scaled by aspect ration)
                Design.TAGS_IMAGE_HEIGHT_X1 / Design.TAGS_IMAGE_SCALE_X1,
                // x2 (scaled by aspect ration)
                Design.TAGS_IMAGE_HEIGHT_X2 / Design.TAGS_IMAGE_SCALE_X2,
                // x3 (full width in right part of table)
                double.infinity,
                // x4 (full width in right part of table)
                double.infinity),
            height: Break.decide(
                context,
                // x1 (specific height)
                Design.TAGS_IMAGE_HEIGHT_X1,
                // x2 (specific height)
                Design.TAGS_IMAGE_HEIGHT_X2,
                // x3 (scale by rows)
                Design.TAGS_IMAGE_SCALE_X3 * Design.TAGS_MENU_ROW_HEIGHT,
                // x4
                Design.TAGS_IMAGE_SCALE_X4 * Design.TAGS_MENU_ROW_HEIGHT),
            image: Images.of(image)));
  }
}
