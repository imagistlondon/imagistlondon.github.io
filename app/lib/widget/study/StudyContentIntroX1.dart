import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/config/Content.dart';
import 'package:flutter/material.dart';

class StudyContentIntroX1 extends StatelessWidget {
  const StudyContentIntroX1({Key key, @required this.studyEnabledVN})
      : super(key: key);

  final ValueNotifier<Project> studyEnabledVN;

  @override
  Widget build(BuildContext context) {
    // CONTAINER
    return Container(
        // PADDING
        padding: EdgeInsets.all(Design.gap(context)),
        // ROW
        child: Column(
            // CROSS ALIGNMENT START
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              H1(text: studyEnabledVN.value.title),
              // subtitle
              H1(text: studyEnabledVN.value.subtitle),
                style: TextStyle(color: Colors.black.withOpacity(0.4)),
              // gap
              const SizedBox(height: Design.SPACE),
              // description
              P(text: studyEnabledVN.value.desc),
            ]));
  }
}
