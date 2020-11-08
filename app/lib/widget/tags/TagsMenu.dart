import 'dart:collection';

import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/UA.dart';
import 'package:app/widget/tags/TagsLink.dart';
import 'package:flutter/material.dart';

class TagsMenu extends StatelessWidget {
  const TagsMenu(
      {Key key,
      this.tagImages,
      this.tagEnabledVN,
      this.tagsSelectedVN,
      this.tagToggle})
      : super(key: key);

  final LinkedHashMap<String, LinkedHashSet<String>> tagImages;
  final ValueNotifier<String> tagEnabledVN;
  final ValueNotifier<LinkedHashSet<String>> tagsSelectedVN;
  final Function tagToggle;

  void onEnter(PointerEvent pe) {}

  void onExit(PointerEvent pe) {
    tagEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    // calculate column size
    final int columnSize = Break.decide(
        context,
        Design.TAGS_MENU_LINKS_PER_ROW_X1,
        Design.TAGS_MENU_LINKS_PER_ROW_X2,
        Design.TAGS_MENU_LINKS_PER_ROW_X3,
        Design.TAGS_MENU_LINKS_PER_ROW_X4);

    // init cells list
    final List<Row> rows = List();
    List<Widget> columns = List();
    int i = 0;
    int j = 0;
    for (String tag in tagImages.keys) {
      if (i > 0 && i % columnSize == 0) {
        rows.add(Row(children: columns));
        columns = List();
        j = 0;
      }
      if (j > 0 && j < columnSize) {
        columns.add(SizedBox(width: Design.SPACE));
      }
      // add column
      columns.add(
        Expanded(
            flex: 1,
            child: TagsLink(
                tag: tag,
                tagEnabledVN: tagEnabledVN,
                tagsSelectedVN: tagsSelectedVN,
                tagToggle: tagToggle,
                first: i < columnSize)),
      );
      i++;
      j++;
    }

    return UA(
        // onHover: HTML.hover,
        onEnter: onEnter,
        onExit: onExit,
        // WRAP
        child: Column(children: rows));
  }
}
