import 'package:url_launcher/url_launcher.dart';

class Utils {
  static openLink(String url) {
    _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future openEmail({required String toEmail}) async {
    await _launchUrl('mailto:$toEmail');
  }
}
