import 'dart:html' as html;

import 'package:app/Index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IndexNotifier extends ChangeNotifier implements ValueListenable<Index> {
  IndexNotifier(this._value);

  @override
  Index get value => _value;
  Index _value;
  set value(Index newValue) {
    if (_value == newValue) return;
    _value = newValue;
    html.window.history
        .pushState(null, newValue.toString(), Indexes.INDEX_URLS[newValue]);
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
