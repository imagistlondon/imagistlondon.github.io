import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/util/L1C.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key, @required this.contentVN, @required this.loadingVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<bool> loadingVN;

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L1C(
        loadingVN,
        (loading, child) => AnimatedOpacity(
            duration: Design.LOADING_OPACITY_ANIMATION_DURATION,
            curve: Design.LOADING_OPACITY_ANIMATION_CURVE,
            opacity: loading ? 1 : 0,
            child: child),
        // CONTAINER
        child: Container(
          // FULL SCREEN SIZE
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // BACKGROUND COLOR
          color: Design.LOADING_PAGE_COLOR,
          // TEXT LINES
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                H1(
                    text: contentVN.value.LOADING_LINE_1,
                    style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR)),
                H1(
                    text: contentVN.value.LOADING_LINE_2,
                    style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR))
              ]),
        ));
  }
}
