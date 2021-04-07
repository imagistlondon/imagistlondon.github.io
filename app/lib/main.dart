import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:app/App.dart';

void main() {
  print('v2.0.5');

  // set no # (hashbang) for web
  setUrlStrategy(PathUrlStrategy());

  // run app
  runApp(App());
}
