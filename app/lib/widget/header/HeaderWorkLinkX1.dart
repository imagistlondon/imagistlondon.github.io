import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/widget/header/HeaderLink.dart';
import 'package:flutter/material.dart';

class HeaderWorkLinkX1 extends StatelessWidget {
  const HeaderWorkLinkX1(
      {Key key,
      @required this.contentVN,
      @required this.indexVN,
      @required this.bulletsEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  Widget build(BuildContext context) {
    return HeaderLink(
        text: contentVN.value.HEADER_WORK,
        onTap: () {
          bulletsEnabledVN.value = true;
          indexVN.value = Index.WORK_SHOWCASE;
        });
  }
}