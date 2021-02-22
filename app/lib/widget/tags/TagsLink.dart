import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class TagsLink extends StatefulWidget {
  const TagsLink(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.tag,
      @required this.tagEnabledVN,
      @required this.tagsSelectedVN,
      @required this.tagToggle,
      this.first})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
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
  static Image xImage = Image(
      image: Images.of(Design.ICON_CROSS),
      color: Design.COLOR,
      height: Design.TAGS_MENU_ROW_HEIGHT / 6);

  // enabled (hover)
  final ValueNotifier<bool> enabledVN = ValueNotifier(false);

  void onTap() {
    if (this.selectable() >= 0) widget.tagToggle(widget.tag);
  }

  void onEnter(PointerEvent pe) {
    if (this.selectable() >= 0) {
      widget.tagEnabledVN.value = widget.tag;
      enabledVN.value = true;
    }
  }

  void onExit(PointerEvent pe) {
    enabledVN.value = false;
  }

  int selectable() {
    // get tags selected
    final Set<String> tagsSelected = widget.tagsSelectedVN.value;

    // skip if no tags selected
    if (tagsSelected == null || tagsSelected.isEmpty) return 1;

    // tag selected
    if (tagsSelected.contains(widget.tag)) return 0;

    // check for association
    for (String tagSelected in tagsSelected) {
      // pull tag associations
      final Set<String> tagAssociations =
          Content.data.TAG_ASSOCIATIONS[tagSelected];

      // if not in assciated tag then return ommited label
      if (!tagAssociations.contains(widget.tag)) return -1;
    }

    // otherwise in all associations so show label
    return 1;
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
                      final int _selectable = this.selectable();
                      if (_selectable == 0) return xLabel;
                      if (_selectable == -1) return oLabel;
                      return label;
                    })))));
  }
}
