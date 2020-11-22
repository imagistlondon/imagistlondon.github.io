import 'dart:collection';

import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L2.dart';
import 'package:app/widget/tags/TagsImage.dart';
import 'package:flutter/material.dart';

class TagsImagesX12 extends StatelessWidget {
  const TagsImagesX12(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.tagEnabledVN,
      @required this.tagsSelectedVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<String> tagEnabledVN;
  final ValueNotifier<Set<String>> tagsSelectedVN;

  static const EdgeInsetsGeometry PADDING =
      EdgeInsets.only(bottom: Design.TAGS_IMAGES_SPACE);

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L2(tagEnabledVN, tagsSelectedVN,
        // COLUMN
        (tagEnabled, tagsSelected) {
      // init images
      final List<String> images = List();

      // pull all images from selected
      for (String tag in tagsSelected)
        for (String image in contentVN.value.TAG_IMAGES[tag]) images.add(image);

      // pull all images from enabled (hovering)
      if (tagEnabled != null)
        for (String image in contentVN.value.TAG_IMAGES[tagEnabled])
          images.add(image);

      return Row(
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
                  child: TagsImage(image: image))
          ]);
    });
  }
}
