import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/studio/StudioContact.dart';
import 'package:app/widget/studio/StudioFooter.dart';
import 'package:flutter/material.dart';

class StudioContent extends StatelessWidget {
  const StudioContent({
    Key key,
    @required this.contentVN,
    @required this.indexVN,
    @required this.studioEnabledVN,
  }) : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> studioEnabledVN;

  // gap between content
  static const SizedBox GAP = SizedBox(height: Design.STUDIO_CONTENT_SPACING);

  @override
  Widget build(BuildContext context) {
    // PADDING
    final EdgeInsetsGeometry padding = EdgeInsets.symmetric(
        horizontal: Design.gap(context) +
            // add additional space for x34
            (Break.x34(context) ? Design.SPACE : 0));

    // clearance
    final SizedBox clearance =
        SizedBox(height: Design.studioClearance(context));

    // SCROLL
    return SingleChildScrollView(
      child: Container(
          // PADDING (HORIZONTAL)
          padding: padding,
          // COLUMN
          child: Column(
              // ALIGNMENT
              crossAxisAlignment: CrossAxisAlignment.start,

              // CHILDREN
              children: <Widget>[
                // HEADER CLEARANCE
                clearance,

                // CONTACT
                StudioContact(contentVN: contentVN),
                GAP,

                // About:
                P(text: contentVN.value.STUDIO_ABOUT_TITLE, selectable: true),
                P(text: contentVN.value.STUDIO_ABOUT_TEXT, selectable: true),
                GAP,

                // Process:
                P(text: contentVN.value.STUDIO_PROCESS_TITLE, selectable: true),
                P(text: contentVN.value.STUDIO_PROCESS_TEXT, selectable: true),
                GAP,

                // FOOTER
                StudioFooter(
                    contentVN: contentVN,
                    indexVN: indexVN,
                    studioEnabledVN: studioEnabledVN),

                // FOOTER CLEARANCE
                clearance,
              ])),
    );
  }
}
