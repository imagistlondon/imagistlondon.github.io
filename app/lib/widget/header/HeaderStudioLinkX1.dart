import 'package:app/config/Content.dart';
import 'package:app/widget/header/HeaderLink.dart';
import 'package:flutter/material.dart';

class HeaderStudioLinkX1 extends StatelessWidget {
  const HeaderStudioLinkX1(
      {Key key, @required this.contentVN, @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<Content> contentVN;
  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    return HeaderLink(
        text: contentVN.value.HEADER_STUDIO,
        faded: true,
        onTap: () {
          studioEnabledVN.value = true;
        });
  }
}