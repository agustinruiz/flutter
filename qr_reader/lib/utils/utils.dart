import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchUrlAddress(BuildContext context, ScanModel scan) async {
  final url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    // abrir el sitio web
    if (!await launchUrl(url)) throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
