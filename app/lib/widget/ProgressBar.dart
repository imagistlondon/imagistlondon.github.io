import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key key, this.position = 0, this.max = 100})
      : super(key: key);

  final double position;
  final double max;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: position > 0,
        child: AnimatedContainer(
            width: position * max,
            height: Design.PROGRESS_BAR_SIZE,
            color: Design.PROGRESS_BAR_COLOR,
            duration: Design.PROGRESS_BAR_ANIMATION_DURATION));
  }
}
