import 'package:app/util/Browsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:app/App.dart';

void main() {
  print('v3.0.0');
  print('Browser.USER_AGENT: ' + Browsers.USER_AGENT);
  print('Browser.BROWSER_AGENT: ' + Browsers.BROWSER_AGENT.toString());
  print('Browser.MOBILE: ' + Browsers.MOBILE.toString());

  // set no # (hashbang) for web
  setUrlStrategy(PathUrlStrategy());

  // run app
  runApp(App());
}
