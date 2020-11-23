import 'package:app/config/Design.dart';
import 'package:app/util/L1.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {Key key, @required this.progressFractionVN, this.max = 100})
      : super(key: key);

  final ValueNotifier<double> progressFractionVN;
  final double max;

  @override
  Widget build(BuildContext context) {
    return L1(
        progressFractionVN,
        (progressFraction) => Visibility(
            visible: progressFraction != null,
            child: AnimatedContainer(
                width: progressFraction != null ? progressFraction * max : 0,
                height: Design.PROGRESS_BAR_SIZE,
                color: Design.PROGRESS_BAR_COLOR,
                duration: Design.PROGRESS_BAR_ANIMATION_DURATION)));
  }
}
