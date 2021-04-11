import 'package:app/config/Design.dart';
import 'package:app/util/X.dart';
import 'package:app/util/Video.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class CinemaClose extends StatelessWidget {
  const CinemaClose({Key key, @required this.cinemaEnabledVN})
      : super(key: key);

  final ValueNotifier<Video> cinemaEnabledVN;

  void onTap() {
    cinemaEnabledVN.value = null;
  }

  @override
  Widget build(BuildContext context) {
    print('CinemaClose.build');
    // ROW
    return Row(
        // ALIGNMENT
        mainAxisAlignment: MainAxisAlignment.end,
        // CHILDREN
        children: <Widget>[
          // POINTER INTERCEPTOR
          PointerInterceptor(
              // X
              child: X(
            // TAP
            onTap: onTap,
            // PADDING
            padding: EdgeInsets.symmetric(
                horizontal: Design.gap(context),
                vertical: Design.cinemaCloseClearance(context)),
            // COLOR
            color: Design.CINEMA_X_COLOR,
          ))
        ]);
  }
}
