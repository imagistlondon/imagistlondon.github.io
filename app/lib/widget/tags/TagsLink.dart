import 'dart:collection';

import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class TagsLink extends StatefulWidget {
  const TagsLink(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.tag,
      @required this.tagEnabledVN,
      @required this.tagsSelectedVN,
      @required this.tagToggle,
      this.first})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final String tag;
  final ValueNotifier<String> tagEnabledVN;
  final ValueNotifier<Set<String>> tagsSelectedVN;
  final Function tagToggle;
  final bool first;

  @override
  TagsLinkState createState() => TagsLinkState();
}

class TagsLinkState extends State<TagsLink> {
  // row border
  static const BorderSide borderSide = BorderSide(
      width: Design.TAGS_MENU_LINK_BORDER_WIDTH,
      color: Design.TAGS_MENU_LINK_BORDER_COLOR);

  // row filler border
  static const BorderSide borderFiller = BorderSide(
      width: Design.TAGS_MENU_LINK_BORDER_WIDTH, color: Colors.transparent);

  // X image
  static const Image xImage = Image(
      image: const AssetImage(Design.ICON_CROSS),
      color: Design.COLOR,
      height: Design.TAGS_MENU_ROW_HEIGHT / 6);

  // enabled (hover)
  final ValueNotifier<bool> enabledVN = ValueNotifier(false);

  void onTap() {
    widget.tagToggle(widget.tag);
  }

  void onEnter(PointerEvent pe) {
    widget.tagEnabledVN.value = widget.tag;
    enabledVN.value = true;
  }

  void onExit(PointerEvent pe) {
    enabledVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // border
    final Border border = Border(
        // TOP
        top: widget.first != null && widget.first ? borderSide : borderFiller,
        // BOTTOM
        bottom: borderSide);

    // label
    final Widget label = P(text: widget.tag);
    final Widget xLabel =
        Row(children: [xImage, SizedBox(width: Design.SPACE / 2), label]);
    final Widget oLabel = P(
        text: widget.tag,
        opacity: Design.TAGS_MENU_LINK_DISABLED_OPACITY); // ommited label

    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        // LISTEN (hover)
        child: L1C(
            enabledVN,
            (enabled, child) => Container(
                // DECORATION
                decoration: BoxDecoration(
                    color: enabled
                        ? Design.TAGS_MENU_LINK_HOVER_BACKGROUND_COLOR
                        : Colors.transparent,
                    border: border),
                // CHILD
                child: child),
            // ELEMENT
            child: Container(
                // HEIGHT
                height: Design.TAGS_MENU_ROW_HEIGHT,
                // ALIGN
                child: Align(
                    alignment: Alignment.centerLeft,
                    // LISTEN (tagsSelected)
                    child: L1(widget.tagsSelectedVN, (tagsSelected) {
                      // skip if no tags selected
                      if (tagsSelected == null || tagsSelected.isEmpty)
                        return label;

                      // tag selected
                      if (tagsSelected.contains(widget.tag)) return xLabel;

                      // check for association
                      for (String tagSelected in tagsSelected) {
                        // pull tag associations
                        final Set<String> tagAssociations = widget
                            .contentVN.value.TAG_ASSOCIATIONS[tagSelected];

                        // if associated tag then return normal label
                        if (tagAssociations.contains(widget.tag)) return label;
                      }

                      // oLabel
                      return oLabel;
                    })))));
  }
}
