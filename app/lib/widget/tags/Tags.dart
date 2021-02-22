import 'dart:collection';

import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/widget/header/HeaderBulletLinksX1.dart';
import 'package:app/widget/tags/TagsImagesX12.dart';
import 'package:app/widget/tags/TagsImagesX34.dart';
import 'package:app/widget/tags/TagsMenu.dart';
import 'package:flutter/material.dart';

class Tags extends StatefulWidget {
  const Tags(
      {Key key,
      @required this.indexVN,
      @required this.bulletsEnabledVN,
      @required this.studyEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;
  final StudyEnabledNotifier studyEnabledVN;

  @override
  TagsState createState() => TagsState();
}

class TagsState extends State<Tags> {
  // tag currently enabled (hovering)
  final ValueNotifier<String> tagEnabledVN = ValueNotifier(null);

  // tags currently selected
  final ValueNotifier<Set<String>> tagsSelectedVN =
      ValueNotifier(LinkedHashSet());

  static final P none = const P(text: 'No tags found.', selectable: true);

  void tagToggle(final String tag) {
    // add
    if (!tagsSelectedVN.value.contains(tag)) {
      this.tagsSelectedVN.value.add(tag);
      this.tagsSelectedVN.value = LinkedHashSet.from(this.tagsSelectedVN.value);
    }
    // remove
    else {
      this.tagsSelectedVN.value.remove(tag);
      this.tagsSelectedVN.value = LinkedHashSet.from(this.tagsSelectedVN.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    // padding
    final EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: Design.gap(context));

    // header/footer spacing
    final SizedBox spacing = SizedBox(height: Design.clearance(context));

    // show no content if tag images are empty
    final bool showNoContent = Content.data.TAG_IMAGES.isEmpty;

    // no content widget
    final Widget noContent = Column(
        children: <Widget>[spacing, Container(padding: padding, child: none)]);

    // _TagsMenu
    final TagsMenu _TagsMenu = TagsMenu(
        indexVN: widget.indexVN,
        studyEnabledVN: widget.studyEnabledVN,
        tagEnabledVN: tagEnabledVN,
        tagsSelectedVN: tagsSelectedVN,
        tagToggle: tagToggle);

    // LISTEN
    return L1(
        widget.indexVN,
        (index) => Visibility(
            visible: index == Index.WORK_TAGS,
            child: showNoContent
                // NO CONTENT
                ? noContent
                // SCROLLABLE
                : SingleChildScrollView(
                    child: Column(children: <Widget>[
                    // HEADER SPACING
                    spacing,
                    // HEADER BULLETS X1
                    Break.x1(context)
                        ? HeaderBulletLinksX1(
                            indexVN: widget.indexVN,
                            bulletsEnabledVN: widget.bulletsEnabledVN)
                        : SizedBox.shrink(),
                    // CONTENT
                    Break.x12(context)
                        ?

                        // X12
                        Column(children: <Widget>[
                            // TOP IMAGES ROW
                            TagsImagesX12(
                                indexVN: widget.indexVN,
                                studyEnabledVN: widget.studyEnabledVN,
                                tagEnabledVN: tagEnabledVN,
                                tagsSelectedVN: tagsSelectedVN),
                            // GAP
                            SizedBox(height: Design.gap(context)),
                            // BOTTOM MENU
                            Container(padding: padding, child: _TagsMenu)
                          ])

                        // X34
                        : Container(
                            padding: padding,
                            child: Row(
                                // (need this when table is smaller than image)
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // LEFT HAND MENU
                                  Expanded(flex: 8, child: _TagsMenu),
                                  // GAP
                                  const SizedBox(width: Design.SPACE),
                                  // RIGHT HAND IMAGE
                                  Expanded(
                                      flex: 4,
                                      child: TagsImagesX34(
                                          indexVN: widget.indexVN,
                                          studyEnabledVN: widget.studyEnabledVN,
                                          tagEnabledVN: tagEnabledVN,
                                          tagsSelectedVN: tagsSelectedVN))
                                ])),
                    // FOOTER SPACING
                    spacing
                  ]))));
  }
}
