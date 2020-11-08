import 'dart:collection';

import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class TagsLink extends StatelessWidget {
  const TagsLink(
      {Key key,
      @required this.tag,
      @required this.tagEnabledVN,
      @required this.tagsSelectedVN,
      @required this.tagToggle,
      this.first})
      : super(key: key);

  final String tag;
  final ValueNotifier<String> tagEnabledVN;
  final ValueNotifier<LinkedHashSet<String>> tagsSelectedVN;
  final Function tagToggle;
  final bool first;

  // row border
  static const BorderSide border = BorderSide(
      width: Design.TAGS_MENU_LINK_BORDER_WIDTH,
      color: Design.TAGS_MENU_LINK_BORDER_COLOR);

  // row filler border
  static const BorderSide borderFiller = BorderSide(
      width: Design.TAGS_MENU_LINK_BORDER_WIDTH, color: Colors.transparent);

  void onTap() {
    this.tagToggle(this.tag);
  }

  void onEnter(PointerEvent pe) {
    this.tagEnabledVN.value = this.tag;
  }

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // LISTEN
        child: L1C(tagEnabledVN, (tagEnabled, child) {
          // active
          final bool active =
              // hovering
              (tagEnabled != null && tagEnabled == tag) ||
                  // selected
                  (tagsSelectedVN.value != null &&
                      tagsSelectedVN.value.contains(tag));

          return Container(
              // DECORATION
              decoration: BoxDecoration(
                  // OPACITY
                  color: Design.TAGS_MENU_LINK_HOVER_BACKGROUND_COLOR
                      .withOpacity(active
                          ? Design.TAGS_MENU_LINK_HOVER_BACKGROUND_COLOR.opacity
                          : 0),
                  // BORDER
                  border: Border(
                      // TOP
                      top: first != null && first ? border : borderFiller,
                      // BOTTOM
                      bottom: border)),

              // ROW
              child: child);
        },
            child: Container(
              // HEIGHT
              height: Design.TAGS_MENU_ROW_HEIGHT,
              // TEXT
              child: Row(children: <Widget>[P(text: tag)]),
            )));
  }
}
