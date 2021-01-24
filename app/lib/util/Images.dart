import 'package:flutter/material.dart';

class Images {
  static ImageProvider of(final String src) {
    if (src.startsWith('assets/')) return AssetImage(src);
    return NetworkImage(src);
  }
}
