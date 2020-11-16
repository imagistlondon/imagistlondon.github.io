import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:flutter/material.dart';

class ArchiveImage extends StatelessWidget {
  const ArchiveImage(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.studyEnabledVN,
      @required this.projectEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<Index> indexVN;
  final ValueNotifier<Project> studyEnabledVN;
  final ValueNotifier<Project> projectEnabledVN;

  @override
  Widget build(BuildContext context) {
    // the number of row heights the image takes up
    final int imageScale = Break.x12(context)
        ? Design.ARCHIVE_IMAGE_SCALE_X12
        : Design.ARCHIVE_IMAGE_SCALE_X34;

    // image height
    final double imageHeight = Design.ARCHIVE_MENU_ROW_HEIGHT * imageScale;

    // the max row size (so that the image does not overflow the table)
    final int rowSizeMax = contentVN.value.ARCHIVE_PROJECTS.length - imageScale;

    // LISTEN
    return L1(projectEnabledVN, (projectEnabled) {
      // pull image to show
      final String image =
          projectEnabled != null ? projectEnabled.archiveImage : null;

      // skip
      if (image == null) return SizedBox.shrink();

      // init imageIndex
      int imageIndex =
          contentVN.value.ARCHIVE_PROJECT_KEY_TO_INDEX[projectEnabled.key];

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

            // IMAGE ROW
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
                  child: Image(
                      fit: Design.ARCHIVE_IMAGE_BOX_FIT,
                      width: Design.ARCHIVE_IMAGE_WIDTH,
                      height: imageHeight,
                      image: AssetImage(image)))
            ])
          ]));
    });
  }
}
