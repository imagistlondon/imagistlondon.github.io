import 'dart:html' as html;

import 'package:app/config/Content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StudyEnabledNotifier extends ChangeNotifier
    implements ValueListenable<Project> {
  StudyEnabledNotifier(this._value);

  @override
  Project get value => _value;
  Project _value;
  set value(Project newValue) {
    if (_value == newValue) return;
    _value = newValue;
    // html.window.history
    //     .pushState(null, newValue.toString(), Indexes.INDEX_URLS[newValue]);
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
