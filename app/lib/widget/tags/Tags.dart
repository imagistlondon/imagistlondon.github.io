import 'dart:collection';

import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1.dart';
import 'package:app/widget/tags/TagsImagesX12.dart';
import 'package:app/widget/tags/TagsImagesX34.dart';
import 'package:app/widget/tags/TagsMenu.dart';
import 'package:flutter/material.dart';

class Tags extends StatefulWidget {
  const Tags(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;

  final ValueNotifier<Index> indexVN;

  final ValueNotifier<Project> studyEnabledVN;

  @override
  TagsState createState() => TagsState();
}

class TagsState extends State<Tags> {
  // tag -> images
  final LinkedHashMap<String, LinkedHashSet<String>> tagImages =
      LinkedHashMap();

  // tag currently enabled (hovering)
  final ValueNotifier<String> tagEnabledVN = ValueNotifier(null);

  // tags currently selected
  final ValueNotifier<LinkedHashSet<String>> tagsSelectedVN =
      ValueNotifier(LinkedHashSet());

  static final P none = const P(text: 'No tags found.');

  @override
  void initState() {
    super.initState();

    // load tag -> images
    for (final Project project in widget.contentVN.value.PROJECTS) {
      // skip if no tags
      if (project.tags == null || project.tags.isEmpty) continue;

      // skip also if no image
      if (project.tagImage == null) continue;

      // loop through tags
      for (final String tag in project.tags) {
        /// add empty list for key
        tagImages.putIfAbsent(tag, () => new LinkedHashSet());

        // add project image thumb
        tagImages[tag].add(project.tagImage);
      }
    }
  }

  void tagToggle(final String tag) {
    // add
    if (!tagsSelectedVN.value.contains(tag)) {
      this.tagsSelectedVN.value.add(tag);
    }
    // remove
    else {
      this.tagsSelectedVN.value.remove(tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    // padding
    final EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: Design.gap(context));

    // header/footer spacing
    final SizedBox spacing =
        SizedBox(height: Design.clearance(context, bulletsOpen: true));

    // LISTEN
    return L1(
        widget.indexVN,
        (index) => Visibility(
            visible: index == Index.WORK_TAGS,
            child: tagImages.isEmpty
                // NO CONTENT
                ? Column(children: <Widget>[
                    spacing,
                    Container(padding: padding, child: none)
                  ])
                // SCROLLABLE
                : SingleChildScrollView(
                    child: Column(children: <Widget>[
                    // HEADER SPACING
                    spacing,
                    // CONTENT
                    Container(
                        // PADDING
                        padding: padding,
                        // ROW
                        child: Break.x12(context)
                            ?

                            // X12
                            Column(children: <Widget>[
                                // TagsImagesX12(
                                //     tagImages: tagImages,
                                //     tagEnabledVN: tagEnabledVN,
                                //     tagsSelectedVN: tagsSelectedVN),
                                TagsMenu(
                                    tagImages: tagImages,
                                    tagEnabledVN: tagEnabledVN,
                                    tagsSelectedVN: tagsSelectedVN,
                                    tagToggle: tagToggle)
                              ])

                            // X34
                            : Row(
                                // (need this when table is smaller than image)
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    // LEFT HAND MENU
                                    Expanded(
                                        flex: 8,
                                        child: TagsMenu(
                                            tagImages: tagImages,
                                            tagEnabledVN: tagEnabledVN,
                                            tagsSelectedVN: tagsSelectedVN,
                                            tagToggle: tagToggle)),
                                    // GAP
                                    SizedBox(width: Design.SPACE),
                                    // RIGHT HAND IMAGE
                                    Expanded(
                                        flex: 4,
                                        child: TagsImagesX34(
                                            tagImages: tagImages,
                                            tagEnabledVN: tagEnabledVN,
                                            tagsSelectedVN: tagsSelectedVN))
                                  ])),
                    // FOOTER SPACING
                    spacing
                  ]))));
  }
}
