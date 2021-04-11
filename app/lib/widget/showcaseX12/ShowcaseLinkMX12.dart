import 'package:app/text/H1.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ShowcaseLinkMX12 extends StatelessWidget {
  const ShowcaseLinkMX12(
      {Key key,
      @required this.studyEnabledVN,
      @required this.project,
      @required this.padding})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final Project project;
  final EdgeInsets padding;

  void onTap() {
    studyEnabledVN.value = project;
  }

  @override
  Widget build(BuildContext context) {
    print('ShowcaseLinkMX12.build');
    // TAP
    return UA(
        onTap: onTap,
        // CONTAINER
        child: Container(
            // PADDING
            padding: padding,
            // TEXT
            child: H1(text: 'Mobile' + project.title)));
  }
}
