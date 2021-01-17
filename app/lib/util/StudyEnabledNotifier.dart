import 'dart:html' as html;

import 'package:app/Index.dart';
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
    // skip
    if (_value == newValue) return;

    // set new value
    _value = newValue;

    // push history state (if new study)
    if (newValue != null) {
      // current path
      final String currentPath = Uri.base.path;

      // study fragment
      final String studyFragment = 'study/' + newValue.key;

      // check if current path already has study fragment
      final bool currentPathAlreadyHasStudyFragment =
          currentPath.endsWith('/' + studyFragment);

      // if not...
      if (!currentPathAlreadyHasStudyFragment) {
        // build new path
        final String newPath = currentPath +
            (currentPath.endsWith('/') ? '' : '/') +
            studyFragment;

        // move history
        html.window.history.pushState(null, 'STUDY ' + newValue.key, newPath);
      }
    }

    // go back history (if study removed)
    else {
      // current path
      final String path = Uri.base.path;
      final List<String> parts = path.split('/');

      // pull parts
      final String part0 = parts.length >= 1 ? parts[0] : null;
      final String part1 = parts.length >= 2 ? parts[1] : null;

      // determin back path
      final String backPath = '/' + (part1 != 'study' ? part1 : part0);

      // find matching index
      final Index index = Indexes.URL_INDEXES[backPath];

      // push to previous page
      html.window.history.pushState(null, index.toString(), backPath);
    }

    // notify
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
