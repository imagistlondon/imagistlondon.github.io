import 'package:app/Index.dart';
import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({Key key, @required this.contentVN, @required this.indexVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;

  @override
  Widget build(BuildContext context) {
    // LISTEN
    return L1(
        indexVN,
        (index) => Visibility(
            visible: index == Index.TERMS,
            // CENTER
            child: Center(
                // CONTAINER
                child: Container(
                    constraints: BoxConstraints(maxWidth: Break.X2),
                    padding: EdgeInsets.all(Design.gap(context)),
                    // COLUMNS
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // H1
                          H1(text: 'Terms'),
                          // TEXT
                          P(text: contentVN.value.TERMS)
                        ])))));
  }
}
