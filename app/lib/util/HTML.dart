import 'package:flutter/material.dart';
import 'dart:html' as html;

class HTML {
  static final appContainer =
      html.window.document.querySelectorAll('flt-glass-pane')[0];

  static void pointer() {
    appContainer.style.cursor = 'pointer';
  }

  static void cursor() {
    appContainer.style.cursor = 'default';
  }

  static void hover(PointerEvent pe) {
    pointer();
  }

  static String href() {
    return html.window.location.href;
  }
}
