import 'dart:async';

import 'package:app/config/Design.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/L1C.dart';
import 'package:app/util/Video.dart';
import 'package:app/util/VideoBox.dart';
import 'package:app/widget/cinema/CinemaClose.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class Cinema extends StatefulWidget {
  const Cinema(
      {Key key, @required this.indexVN, @required this.cinemaEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<Video> cinemaEnabledVN;

  @override
  CinemaState createState() => CinemaState();
}

class CinemaState extends State<Cinema> {
  // matrixA
  static final Matrix4 matrixA = Matrix4Transform().translate(y: 0).matrix4;

  // the content holder
  final ValueNotifier<Video> contentVN = new ValueNotifier(null);

  Timer timer;

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Cinema.build');
    // screen width
    final double width = MediaQuery.of(context).size.width;

    // screen height
    final double height = MediaQuery.of(context).size.height;

    // matrixB
    final Matrix4 matrixB = Matrix4Transform().translate(y: height).matrix4;

    // video width
    final double videoWidth = width * 0.8;

    // LISTEN
    return L1C(widget.cinemaEnabledVN,
        // ANIMATE (TRANSLATION)
        (final Video video, child) {
      print('Cinema.L1C.cinemaEnabled.' + (video != null ? video.id : 'null'));

      // set the content video after the slide animation has finished
      timer = Timer(Design.CINEMA_SLIDE_ANIMATION_DURATION, () {
        contentVN.value = widget.cinemaEnabledVN.value;
      });

      return AnimatedContainer(
          // DURATION
          duration: Design.CINEMA_SLIDE_ANIMATION_DURATION,
          // CURVE
          curve: Design.CINEMA_SLIDE_ANIMATION_CURVE,
          // TRANSFORM
          transform: video != null ? matrixA : matrixB,
          // CHILD
          child: child);
    },
        // CHILD (content)
        child: Container(
            // WIDTH
            width: width,
            // HEIGHT
            height: height,
            // COLOR
            color: Design.CINEMA_BACKGROUND_COLOR,
            // STACK
            child: Stack(children: <Widget>[
              // CENTER
              Center(
                  child: L1(contentVN, (Video video) {
                print(
                    'Cinema.L1.content.' + (video != null ? video.id : 'null'));
                // VIDEO BOX
                return video != null
                    ? VideoBox(
                        width: videoWidth,
                        video: video,
                        cinemaEnabledVN: widget.cinemaEnabledVN)
                    : Container(
                        width: videoWidth,
                        height: videoWidth * Video.DEFAULT_HEIGHT_FACTOR,
                        color: Colors.black);
              })),
              // CLOSE (X)
              CinemaClose(cinemaEnabledVN: widget.cinemaEnabledVN),
            ])));
  }
}
