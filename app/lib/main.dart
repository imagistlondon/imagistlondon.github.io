import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:app/App.dart';

void main() {
  print('v1.0.3');

  // set no # (hashbang) for web
  setUrlStrategy(PathUrlStrategy());

  // run app
  runApp(App());
}
