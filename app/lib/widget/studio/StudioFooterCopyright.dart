import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/P.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudioFooterCopyright extends StatelessWidget {
  const StudioFooterCopyright({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return P(
        style: const TextStyle(color: Design.STUDIO_FOOTER_TEXT_COLOR),
        text: Content.data.STUDIO_COPYRIGHT_PREFIX +
            DateFormat('yyyy').format(DateTime.now()),
        selectable: true);
  }
}
