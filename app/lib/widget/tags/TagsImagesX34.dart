import 'dart:collection';

import 'package:app/config/Design.dart';
import 'package:app/util/L2.dart';
import 'package:app/widget/tags/TagsImage.dart';
import 'package:flutter/material.dart';

class TagsImagesX34 extends StatelessWidget {
  const TagsImagesX34(
      {Key key, this.tagImages, this.tagEnabledVN, this.tagsSelectedVN})
      : super(key: key);

  final LinkedHashMap<String, LinkedHashSet<String>> tagImages;
  final ValueNotifier<String> tagEnabledVN;
  final ValueNotifier<LinkedHashSet<String>> tagsSelectedVN;

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
        for (String image in tagImages[tag]) images.add(image);

      // pull all images from enabled (hovering)
      if (tagEnabled != null)
        for (String image in tagImages[tagEnabled]) images.add(image);

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
                  child: TagsImage(image: image))
          ]);
    });
  }
}
