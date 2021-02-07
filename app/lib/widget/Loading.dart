import 'dart:async';

import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/L1C.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class Loading extends StatefulWidget {
  const Loading(
      {Key key,
      @required this.contentVN,
      @required this.loadingVN,
      @required this.loadingEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<bool> loadingVN;
  final ValueNotifier<bool> loadingEnabledVN;

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  // ticket to close loading page
  Timer timer;

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  // static
  static final Matrix4 matrixA = Matrix4Transform().down(0).matrix4;

  @override
  Widget build(BuildContext context) {
    // calculate sizes
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // move up
    final Matrix4 matrixB =
        Matrix4Transform().up(MediaQuery.of(context).size.height).matrix4;

    // LISTEN (loadingEnabled)
    return L1C(
        widget.loadingEnabledVN,
        // VISIBLE
        (loadingEnabled, child) => Visibility(
            visible: loadingEnabled,
            // LISTEN (loading)
            child: L1C(widget.loadingVN, (loading, child) {
              // initiate close of loading page after animation
              if (!loading) {
                if (timer != null) {
                  timer.cancel();
                  timer = null;
                }
                timer = Timer(Design.LOADING_TRANSLATE_ANIMATION_DURATION, () {
                  widget.loadingEnabledVN.value = false;
                });
              }

              // ANIMATED CONTAINER
              return AnimatedContainer(
                  // duration
                  duration: Design.LOADING_TRANSLATE_ANIMATION_DURATION,
                  // curve
                  curve: Design.LOADING_TRANSLATE_ANIMATION_CURVE,
                  // transform
                  transform: loading ? matrixA : matrixB,
                  child: child);
            }, child: child)),
        // CONTAINER
        child: Container(
          // FULL SCREEN SIZE
          width: width,
          height: height,
          // BACKGROUND COLOR
          color: Design.LOADING_PAGE_COLOR,
          // TEXT LINES
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            // LINE 1
            Container(
                // padding
                padding: EdgeInsets.symmetric(horizontal: Design.gap(context)),
                // H1
                child: H1(
                    text: widget.contentVN.value.LOADING_LINE_1,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR))),
            // LINE 2
            Container(
                // padding
                padding: EdgeInsets.symmetric(horizontal: Design.gap(context)),
                // H1
                child: H1(
                    text: widget.contentVN.value.LOADING_LINE_2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR)))
          ]),
        ));
  }
}
