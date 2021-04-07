import 'package:app/config/Design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

class Images {
  // cache of image providers
  static final Map<String, ImageProvider> cache = new Map();

  // widget :- (src :- GifController)
  // holds all the src gifControllers for each widget
  static final Map<String, Map<String, GifController>> widgetGifControllers =
      Map();

  /**
   * Pulls an image provider of the src
   */
  static ImageProvider provider(final String src) {
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

  /**
   * Will build an image from the src and parameters.
   * 
   * Will return an Image or GifImage
   */
  static dynamic of(final String src,
      {final double width,
      final double height,
      final BoxFit fit,
      final Color color,
      final TickerProvider vsync,
      final Duration gifDuration}) {
    // pull the provider (from the cache)
    final ImageProvider provider = Images.provider(src);

    // flag if gif
    final bool isGif = src.endsWith('.gif') || src.endsWith('.GIF');
    final bool isSafari = Browser().browserAgent == BrowserAgent.Safari;

    // handle special gif
    if (isGif && isSafari && vsync != null) {
      final String widgetKey = vsync.toString();

      // create new gif controller map for this vsync class
      widgetGifControllers.putIfAbsent(widgetKey, () => Map());

      // extract widget's gif controllers
      final Map<String, GifController> gifControllers =
          widgetGifControllers[widgetKey];

      // create a new gif controller for this image src
      gifControllers.putIfAbsent(src, () => GifController(vsync: vsync));

      // extract gif controller for this src
      final GifController gifController = gifControllers[src];

      // gif duration
      final Duration gifDurationChosen =
          gifDuration != null ? gifDuration : Design.DEFAULT_GIF_DURATION;

      // initiate the gif repeat
      fetchGif(provider).then((gifInfos) {
        gifController.repeat(
            min: 0, max: gifInfos.length.toDouble(), period: gifDurationChosen);
      });

      print('Images.gif:' + src + ':' + gifDurationChosen.toString());
      return GifImage(
          controller: gifController,
          width: width,
          height: height,
          fit: fit,
          color: color,
          image: provider);
    }

    print('Images.src:' + src);

    // normal image
    return Image(
        width: width, height: height, fit: fit, color: color, image: provider);
  }

  /**
   * Will dispose of the widget's gif controllers
   */
  static void disposeGifControllers(final TickerProvider vsync) {
    // build widget key
    final String widgetKey = vsync.toString();
    print('Images.disposeGifControllers.widgetKey:' + widgetKey);

    // skip if no gif controllers for widget
    if (!widgetGifControllers.containsKey(widgetKey)) return;

    // get gif controllers for widget
    final Map<String, GifController> gifControllers =
        widgetGifControllers[widgetKey];

    // dispose of the the gif controllers for this widget
    gifControllers.forEach((src, gifController) {
      if (gifController != null) gifController.dispose();
    });
  }

  /**
   * Will precache a src
   */
  static Future<void> precache(final String src, final BuildContext context) {
    if (src == null || src == '') return null;
    return precacheImage(provider(src), context);
  }
}
