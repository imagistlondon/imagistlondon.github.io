import 'package:flutter/material.dart';

import 'dart:html';
import 'dart:ui' as ui;

enum VideoProvider { VIMEO, YOUTUBE }

class VideoFrame extends StatelessWidget {
  const VideoFrame({
    Key key,
    this.provider = VideoProvider.VIMEO,
    @required this.id,
    this.width = 16.0 * 10,
    this.height = 9.0 * 10,
  }) : super(key: key);

  final VideoProvider provider;
  final String id;
  final double width;
  final double height;

  static final Map<VideoProvider, String> PROVIDER_BASE = {
    VideoProvider.VIMEO: 'https://player.vimeo.com/video/',
    VideoProvider.YOUTUBE: 'https://www.youtube.com/embed/'
  };

  @override
  Widget build(BuildContext context) {
    // build iframe element
    final IFrameElement iframeElement = IFrameElement();
    iframeElement.width = width.toString();
    iframeElement.height = height.toString();
    iframeElement.src = PROVIDER_BASE[this.provider] + id;
    iframeElement.style.border = 'none';

    // define custom regustry id
    final String registryId = 'videoFrame' + id;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      registryId,
      (int viewId) => iframeElement,
    );

    // wrap in html element view
    return HtmlElementView(
      key: UniqueKey(),
      viewType: registryId,
    );
  }
}
