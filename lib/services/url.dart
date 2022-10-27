import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalUrl {
  static launchURL(BuildContext context, Uri url) async {
    if (!await launchUrl(url)) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("URL not Found !")));
    }
  }
}
