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
    // skip if nothing new
    if (_value == newValue) return;

    // set new value
    _value = newValue;

    // move to new history
    html.window.history
        .pushState(null, newValue.toString(), Indexes.INDEX_URLS[newValue]);

    // notify
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
