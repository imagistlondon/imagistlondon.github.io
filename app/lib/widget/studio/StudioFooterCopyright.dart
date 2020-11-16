import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudioFooterCopyright extends StatelessWidget {
  const StudioFooterCopyright({Key key, @required this.contentVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;

  @override
  Widget build(BuildContext context) {
    return P(
        style: const TextStyle(color: Design.STUDIO_FOOTER_TEXT_COLOR),
        text: contentVN.value.STUDIO_COPYRIGHT_PREFIX +
            DateFormat('yyyy').format(DateTime.now()));
  }
}
