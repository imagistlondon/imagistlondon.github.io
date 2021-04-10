import 'package:app/util/Video.dart';
import 'package:flutter/material.dart';

import 'dart:html';
import 'dart:ui' as ui;

class VideoFrame extends StatelessWidget {
  const VideoFrame(
      {Key key, this.width: Video.DEFAULT_WIDTH, @required this.video})
      : super(key: key);

  final double width;
  final Video video;

  static final String BASE = 'https://player.vimeo.com/video/';

  @override
  Widget build(BuildContext context) {
    // calculate height
    final double height = video.height(context, width: width);

    // build iframe element
    final IFrameElement iframeElement = IFrameElement();
    iframeElement.width = width.toString();
    iframeElement.height = height.toString();
    iframeElement.src = BASE + video.id;
    iframeElement.style.border = 'none';
    iframeElement.allowFullscreen = false;

    // iframeElement.style.cursor = 'auto';

    // define custom regitry id
    final String registryId = 'videoFrame' + video.id + UniqueKey().toString();
    print('VideoFrame.registryId.' + registryId);

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      registryId,
      (int viewId) => iframeElement,
    );

    // build video widget
    return SizedBox(
        width: width,
        height: height,
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: registryId,
        ));
  }
}
