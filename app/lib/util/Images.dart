import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Images {
  static Map<String, ImageProvider> cache = new Map();

  static ImageProvider of(final String src) {
    // get from cache
    if (cache.containsKey(src)) return cache[src];

    // provider
    final ImageProvider provider = (src == null || src == '')
        ? MemoryImage(kTransparentImage)
        : (src.startsWith('assets/') ? AssetImage(src) : NetworkImage(src));

    // add to cache
    cache[src] = provider;

    return provider;
  }

  static Future<void> precache(final String src, final BuildContext context) {
    if (src == null || src == '') return null;
    return precacheImage(of(src), context);
  }
}
