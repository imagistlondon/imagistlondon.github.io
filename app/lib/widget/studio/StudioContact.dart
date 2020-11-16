import 'package:app/config/Content.dart';
import 'package:app/widget/studio/StudioContactAddress.dart';
import 'package:app/widget/studio/StudioContactEmail.dart';
import 'package:app/widget/studio/StudioContactInstagram.dart';
import 'package:app/widget/studio/StudioContactPhone.dart';
import 'package:flutter/material.dart';

class StudioContact extends StatelessWidget {
  const StudioContact({Key key, @required this.contentVN}) : super(key: key);

  final ValueNotifier<Content> contentVN;

  @override
  Widget build(BuildContext context) {
    return Column(
        // ALIGNMENT
        crossAxisAlignment: CrossAxisAlignment.start,
        // CHILDREN
        children: <Widget>[
          // email
          StudioContactEmail(contentVN: contentVN),

          // phone
          StudioContactPhone(contentVN: contentVN),

          // address
          StudioContactAddress(contentVN: contentVN),

          // instagram
          StudioContactInstagram(contentVN: contentVN)
        ]);
  }
}
