import 'package:app/config/Break.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/text/H1.dart';
import 'package:app/text/P.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key key, @required this.contentVN}) : super(key: key);

  final ValueNotifier<Content> contentVN;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            constraints: BoxConstraints(maxWidth: Break.X2),
            padding: EdgeInsets.all(Design.SPACE * 2),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  H1(text: 'Terms'),
                  P(text: contentVN.value.TERMS)
                ])));
  }
}
