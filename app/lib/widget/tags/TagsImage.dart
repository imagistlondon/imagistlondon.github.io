import 'package:app/config/Break.dart';
import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

class TagsImage extends StatelessWidget {
  const TagsImage({Key key, this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    // skip
    if (image == null) return SizedBox.shrink();

    // the number of row heights the image takes up
    final int imageScale = Break.x12(context)
        ? Design.TAGS_IMAGE_SCALE_X12
        : Design.TAGS_IMAGE_SCALE_X34;

    // image height
    final double imageHeight = Design.TAGS_MENU_ROW_HEIGHT * imageScale;

    return Image(
        fit: Design.TAGS_IMAGE_BOX_FIT,
        width: Design.TAGS_IMAGE_WIDTH,
        height: imageHeight,
        image: AssetImage(image));
  }
}
