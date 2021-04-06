import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ArchiveImage extends StatefulWidget {
  const ArchiveImage(
      {Key key,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final StudyEnabledNotifier studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  @override
  ArchiveImageState createState() => ArchiveImageState();
}

class ArchiveImageState extends State<ArchiveImage> {
  final ValueNotifier<int> hoverIndexVN = ValueNotifier(null);

  void onTap(int index) {
    widget.studyEnabledVN.value = Content.data.ARCHIVE_PROJECTS[index];
  }

  void onEnter(int index) {
    hoverIndexVN.value = index;
    widget.projectEnabledVN.value = Content.data.ARCHIVE_PROJECTS[index];
  }

  void onExit(int index) {
    hoverIndexVN.value = null;
    widget.projectEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    // the number of row heights the image takes up
    final int imageScale = Break.x12(context)
        ? Design.ARCHIVE_IMAGE_SCALE_X12
        : Design.ARCHIVE_IMAGE_SCALE_X34;

    // image width
    final double imageWidth = Design.screenInnerWidth(context) * 4 / 12;

    // image height
    final double imageHeight = Design.ARCHIVE_MENU_ROW_HEIGHT * imageScale;

    // the max row size (so that the image does not overflow the table)
    final int rowSizeMax = Content.data.ARCHIVE_PROJECTS.length - imageScale;

    // LISTEN
    return L1(widget.projectEnabledVN, (projectEnabled) {
      // pull image to show
      final String image =
          projectEnabled != null ? projectEnabled.archiveImage : null;

      // skip
      if (image == null) return SizedBox.shrink();

      // init imageIndex
      int imageIndex =
          Content.data.ARCHIVE_PROJECT_KEY_TO_INDEX[projectEnabled.key];

      // limit the rowSize to max
      if (imageIndex > rowSizeMax) imageIndex = rowSizeMax;

      return Container(
          // PADDING
          padding: EdgeInsets.symmetric(horizontal: Design.gap(context)),

          // COLUMN
          child: Column(children: <Widget>[
            // EMPTY ROWS
            for (int i = 0; i < imageIndex; i++)
              Container(height: Design.ARCHIVE_MENU_ROW_HEIGHT),

            // STACK
            Stack(children: [
              // IMAGE BLOCK ROW
              Row(children: <Widget>[
                // OFFSET
                Expanded(
                    flex: 8,
                    child: Container(
                      height: Design.ARCHIVE_MENU_ROW_HEIGHT,
                    )),

                // IMAGE
                Expanded(
                  flex: 4,
                  child: Images.of(image,
                      fit: Design.ARCHIVE_IMAGE_BOX_FIT,
                      width: imageWidth,
                      height: imageHeight),
                ),
              ]),

              // OVERLAY ROWS
              Row(children: <Widget>[
                // OFFSET OVERLAY (HOVER GREY)
                Expanded(
                    flex: 8,
                    child: Column(children: <Widget>[
                      for (int i = imageIndex; i < imageIndex + imageScale; i++)
                        UA(
                            onTap: () => this.onTap(i),
                            onEnter: (pe) => this.onEnter(i),
                            onExit: (pe) => this.onExit(i),
                            child: L1C(
                                hoverIndexVN,
                                (hoverIndex, child) => Container(
                                    // HEIGHT
                                    height: Design.ARCHIVE_MENU_ROW_HEIGHT,

                                    // OPACITY
                                    color: Design
                                        .ARCHIVE_MENU_LINK_HOVER_BACKGROUND_COLOR
                                        .withOpacity(hoverIndex == i
                                            ? Design
                                                .ARCHIVE_MENU_LINK_HOVER_BACKGROUND_COLOR
                                                .opacity
                                            : 0)),
                                // CHILD
                                child: Container(
                                    height: Design.ARCHIVE_MENU_ROW_HEIGHT)))
                    ])),

                // IMAGE OVERLAY
                Expanded(
                    flex: 4,
                    child: Column(children: <Widget>[
                      for (int i = imageIndex; i < imageIndex + imageScale; i++)
                        UA(
                            onTap: () => this.onTap(i),
                            onEnter: (pe) => this.onEnter(i),
                            onExit: (pe) => this.onExit(i),
                            child: Container(
                                height: Design.ARCHIVE_MENU_ROW_HEIGHT))
                    ])),
              ]),
            ])
          ]));
    });
  }
}
