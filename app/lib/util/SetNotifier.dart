import 'dart:collection';

import 'package:flutter/foundation.dart';

class SetNotifier<E> extends ChangeNotifier
    implements ValueListenable<LinkedHashSet<E>> {
  SetNotifier(this._value);

  @override
  LinkedHashSet<E> get value => _value;

  LinkedHashSet<E> _value;

  set value(LinkedHashSet<E> newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  void add(E element) {
    // skip if no element
    if (element == null) return;

    // no set
    if (_value == null) {
      _value = LinkedHashSet();
      _value.add(element);
      return notifyListeners();
    }

    // skip if already contains element
    if (_value.contains(element)) {
      return;
    }

    _value.add(element);
    notifyListeners();
  }

  void remove(E element) {
    // skip if no element
    if (element == null) return;

    // skip if null
    if (_value == null) return;

    // skip if empty
    if (_value.isEmpty) return;

    // skip if does not contain element
    if (!_value.contains(element)) {
      return;
    }

    _value.remove(element);
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
