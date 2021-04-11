import 'package:web_browser_detect/web_browser_detect.dart';
import 'package:universal_html/html.dart';

class Browsers {
  static final Browser BROWSER = Browser();
  static final BrowserAgent BROWSER_AGENT = BROWSER.browserAgent;
  static final bool SAFARI = BROWSER_AGENT == BrowserAgent.Safari;
  static final bool CHROME = BROWSER_AGENT == BrowserAgent.Chrome;

  static final bool MOBILE =
      new RegExp('/Mobi/i').hasMatch(window.navigator.userAgent);
}
