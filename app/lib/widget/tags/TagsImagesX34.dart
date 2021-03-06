import 'dart:collection';

import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L2.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/tags/TagsImage.dart';
import 'package:flutter/material.dart';

class TagsImagesX34 extends StatelessWidget {
  const TagsImagesX34(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.tagEnabledVN,
      @required this.tagsSelectedVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<String> tagEnabledVN;
  final ValueNotifier<Set<String>> tagsSelectedVN;

  static const EdgeInsetsGeometry PADDING =
      EdgeInsets.only(bottom: Design.TAGS_IMAGES_VERTICAL_SPACE);

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L2(tagEnabledVN, tagsSelectedVN,
        // COLUMN
        (tagEnabled, tagsSelected) {
      // init images
      final Set<String> images = LinkedHashSet();

      // pull all images from selected
      for (String tag in tagsSelected)
        for (String image in Content.data.TAG_IMAGES[tag]) images.add(image);

      // pull all images from enabled (hovering)
      if (tagEnabled != null)
        for (String image in Content.data.TAG_IMAGES[tagEnabled])
          images.add(image);

      return Column(
          // ALIGNMENT
          crossAxisAlignment: CrossAxisAlignment.start,
          // CHILDREN
          children: <Widget>[
            for (final String image in images)
              // CONTAINER
              Container(
                  // PADDING
                  padding: PADDING,
                  // TagsImage
                  child: TagsImage(
                      indexVN: indexVN,
                      studyEnabledVN: studyEnabledVN,
                      image: image))
          ]);
    });
  }
}
