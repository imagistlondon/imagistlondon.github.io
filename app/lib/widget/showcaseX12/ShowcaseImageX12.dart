import 'package:app/config/Content.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/StudyEnabledNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class ShowcaseImageX12 extends StatefulWidget {
  const ShowcaseImageX12(
      {Key key,
      @required this.studyEnabledVN,
      @required this.project,
      @required this.width,
      @required this.height,
      @required this.padding})
      : super(key: key);

  final StudyEnabledNotifier studyEnabledVN;
  final Project project;
  final double width;
  final double height;
  final EdgeInsets padding;

  @override
  ShowcaseImageX12State createState() => ShowcaseImageX12State();
}

class ShowcaseImageX12State extends State<ShowcaseImageX12>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    Images.disposeGifControllers(this);
  }

  void onTap() {
    widget.studyEnabledVN.value = widget.project;
  }

  @override
  Widget build(BuildContext context) {
    print('ShowcaseImageX12.build');

    // TAP
    return UA(
        onTap: onTap,
        // CONTAINER
        child: Container(
            padding: widget.padding,
            child: Images.of(widget.project.showcaseImage,
                fit: BoxFit.cover,
                width: widget.width,
                height: widget.height,
                gifDuration: widget.project.showcaseImageGifDuration,
                vsync: this)));
  }
}
