import 'package:url_launcher/url_launcher.dart';

class URL {
  // will open the URL in new tab
  static void open(String url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      print('URL.open|' + url + '|failed');
  }

  // will open an email address
  static void openEmail(String email, {String subject}) async {
    final Uri uri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {'subject': subject != null ? subject : 'Hello'});
    open(uri.toString());
  }

  // will open a phone number
  static void openPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);
    open(uri.toString());
  }
}
