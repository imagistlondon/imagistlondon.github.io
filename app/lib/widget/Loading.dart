import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key, @required this.enabledVN}) : super(key: key);

  final ValueNotifier<bool> enabledVN;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: enabledVN.value,
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
                    text: Content.LOADING_LINE_1,
                    style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR)),
                H1(
                    text: Content.LOADING_LINE_2,
                    style: TextStyle(color: Design.LOADING_PAGE_TEXT_COLOR))
              ]),
        ));
  }
}
