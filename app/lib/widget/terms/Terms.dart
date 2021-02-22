import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/util/Section.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key key, @required this.indexVN}) : super(key: key);

  final IndexNotifier indexVN;

  @override
  Widget build(BuildContext context) {
    // clearance
    final SizedBox clearance = SizedBox(height: Design.clearance(context));

    // LISTEN
    return L1(
        indexVN,
        (index) => Visibility(
            visible: index == Index.TERMS,
            // SCROLL
            child: SingleChildScrollView(
                // COLUMN
                child: Section(
                    gap: true,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // VERTICAL SPACING
                          clearance,
                          // H1
                          H1(text: 'Terms & Conditions', selectable: true),
                          // TEXT
                          P(text: Content.data.TERMS, selectable: true),
                          // VERTICAL SPACING
                          clearance
                        ])))));
  }
}
