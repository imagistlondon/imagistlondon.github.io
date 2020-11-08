import 'package:app/config/Content.dart';
import 'package:app/widget/header/HeaderLink.dart';
import 'package:flutter/material.dart';

class HeaderStudioLink extends StatelessWidget {
  const HeaderStudioLink({Key key, @required this.studioEnabledVN})
      : super(key: key);

  final ValueNotifier<bool> studioEnabledVN;

  @override
  Widget build(BuildContext context) {
    return HeaderLink(
        text: Content.HEADER_STUDIO,
        faded: true,
        onTap: () {
          studioEnabledVN.value = true;
        });
  }
}
