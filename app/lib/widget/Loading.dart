import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/L1C.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class Loading extends StatelessWidget {
  const Loading({Key key, @required this.loadingVN}) : super(key: key);

  // whether the app is loading
  final ValueNotifier<bool> loadingVN;

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

    // build child
    final Container child = Container(
        // FULL SCREEN SIZE
        width: width,
        height: height,
        // BACKGROUND COLOR
        color: Design.LOADING_PAGE_COLOR,
        // TEXT LINES
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // LINE 1
              Container(
                  // padding
                  padding:
                      EdgeInsets.symmetric(horizontal: Design.gap(context)),
                  // H1
                  child: H1(
                      text: Design.LOADING_LINE_1,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR))),
              // LINE 2
              Container(
                  // padding
                  padding:
                      EdgeInsets.symmetric(horizontal: Design.gap(context)),
                  // H1
                  child: H1(
                      text: Design.LOADING_LINE_2,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR)))
            ]));

    // LISTEN (loading)
    return L1C(loadingVN, (loading, child) {
      // ANIMATED CONTAINER
      return AnimatedContainer(
          // duration
          duration: Design.LOADING_TRANSLATE_ANIMATION_DURATION,
          // curve
          curve: Design.LOADING_TRANSLATE_ANIMATION_CURVE,
          // transform
          transform: loading ? matrixA : matrixB,
          child: child);
    }, child: child);
  }
}
