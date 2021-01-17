import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class StudyArrow extends StatefulWidget {
  const StudyArrow(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.scrollController})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ScrollController scrollController;

  @override
  StudyArrowState createState() => StudyArrowState();
}

class StudyArrowState extends State<StudyArrow> {
  final ValueNotifier<bool> hoverVN = ValueNotifier(false);

  // IMAGE
  static const IMAGE = Image(
      image: const AssetImage(Design.STUDY_ARROW_IMAGE),
      width: Design.STUDY_ARROW_WIDTH,
      color: Design.STUDY_ARROW_COLOR);

  void onEnter(PointerEvent pe) {
    hoverVN.value = true;
  }

  void onExit(PointerEvent pe) {
    hoverVN.value = false;
  }

  void onTap() {
    widget.scrollController.animateTo(
        widget.scrollController.position.minScrollExtent,
        duration: Design.STUDY_SCROLL_TO_TOP_ANIMATION_DURATION,
        curve: Design.STUDY_SCROLL_TO_TOP_ANIMATION_CURVE);
  }

  @override
  Widget build(BuildContext context) {
    // COLUMN
    return Column(
        // ALIGNMENT (BOTTOM)
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // ROW
          Row(
              // ALIGNMENT (RIGHT)
              mainAxisAlignment: MainAxisAlignment.end,
              // CHILDREN
              children: <Widget>[
                UA(
                    onTap: onTap,
                    onEnter: onEnter,
                    onExit: onExit,
                    // PADDED CONTAINER
                    child: Container(
                        padding: EdgeInsets.all(Design.gap(context)),
                        // CLIP
                        child: ClipRect(
                            // LISTENER
                            child: L1C(
                                hoverVN,
                                // ANIMATED ALIGN
                                (hover, child) => AnimatedAlign(
                                    // DURATION
                                    duration:
                                        Design.STUDY_ARROW_ANIMATION_DURATION,
                                    alignment: Alignment.topCenter,
                                    widthFactor: 1.0,
                                    heightFactor: hover
                                        ? 1.0
                                        : Design
                                            .STUDY_ARROW_ANIMATION_HEIGHT_SCALE,
                                    child: child),
                                // IMAGE
                                child: IMAGE))))
              ])
        ]);
  }
}
