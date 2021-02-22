import 'package:app/widget/studio/StudioContactAddress.dart';
import 'package:app/widget/studio/StudioContactEmail.dart';
import 'package:app/widget/studio/StudioContactInstagram.dart';
import 'package:app/widget/studio/StudioContactPhone.dart';
import 'package:flutter/material.dart';

class StudioContact extends StatelessWidget {
  const StudioContact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        // ALIGNMENT
        crossAxisAlignment: CrossAxisAlignment.start,
        // CHILDREN
        children: <Widget>[
          // email
          StudioContactEmail(),

          // phone
          StudioContactPhone(),

          // address
          StudioContactAddress(),

          // instagram
          StudioContactInstagram()
        ]);
  }
}
