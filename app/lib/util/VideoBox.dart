import 'package:app/util/Browsers.dart';
import 'package:app/util/UA.dart';
import 'package:app/util/Video.dart';
import 'package:app/util/VideoFrame.dart';
import 'package:flutter/material.dart';

import 'package:pointer_interceptor/pointer_interceptor.dart';

class VideoBox extends StatelessWidget {
  const VideoBox(
      {Key key,
      @required this.width,
      @required this.video,
      @required this.cinemaEnabledVN})
      : super(key: key);

  final double width;
  final Video video;
  final ValueNotifier<Video> cinemaEnabledVN;

  void onTap() {
    print('VideoBox.onTap.video.id' + video.id);
    if (video.cinema) cinemaEnabledVN.value = video;
  }

  @override
  Widget build(BuildContext context) {
    print('VideoBox.build.' + video.id);
    // wrap in html element view
    return Stack(children: [
      // VIDEO FRAME
      VideoFrame(width: width, video: video),
      // SCROLL HACK (Affects all Chrome and also Safari Mobile)
      PointerInterceptor(
          // UA
          child: UA(
              onTap: onTap,
              child: SizedBox(
                  width: width, height: video.height(context, width: width)))),
    ]);
  }
}
