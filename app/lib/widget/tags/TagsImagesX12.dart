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

  static const EdgeInsetsGeometry PADDING_LEFT =
      EdgeInsets.only(left: Design.TAGS_IMAGES_HORIZONTAL_SPACE);

  @override
  Widget build(BuildContext context) {
    // margin gap
    final EdgeInsetsGeometry screenPadding =
        EdgeInsets.symmetric(horizontal: Design.gap(context));

    // LISTEN
    return L2(tagEnabledVN, tagsSelectedVN, (tagEnabled, tagsSelected) {
      // init images
      final Set<String> images = LinkedHashSet();

      // pull all images from selected
      for (String tag in tagsSelected)
        for (String image in contentVN.value.TAG_IMAGES[tag]) images.add(image);

      // pull all images from enabled (hovering)
      if (tagEnabled != null)
        for (String image in contentVN.value.TAG_IMAGES[tagEnabled])
          images.add(image);

      // add placeholder (i.e at least 1 image);
      if (images.isEmpty) images.add('assets/empty.png');

      // build image elements
      final List<Widget> imageElements = List();
      int i = 0;
      for (final String image in images) {
        imageElements.add(Container(
            // non-first element has left padding
            padding: i > 0 ? PADDING_LEFT : null,
            child: TagsImage(
                contentVN: contentVN,
                indexVN: indexVN,
                studyEnabledVN: studyEnabledVN,
                image: image)));
        i++;
      }

      // SCROLL
      return SingleChildScrollView(
          // (HORIZONTAL)
          scrollDirection: Axis.horizontal,
          // CONTAINER
          child: Container(
              // MIN SCREEN WIDTH
              constraints:
                  BoxConstraints(minWidth: Design.screenWidth(context)),
              // SRCEEN PADDING
              padding: screenPadding,
              // ROW of IMAGE ELEMENTS
              child: Row(children: imageElements)));
    });
  }
}
