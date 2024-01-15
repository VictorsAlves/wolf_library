import 'package:url_launcher/url_launcher.dart';

class ListBookController {
  Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir $urlString';
    }
  }
}
