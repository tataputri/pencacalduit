import 'package:flutter/material.dart';
import 'package:template_spam_playtore/constants/colors_style.dart';
import 'package:template_spam_playtore/constants/fonts_style.dart';
import 'package:template_spam_playtore/views/widgets/cache_img_widget.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(BuildContext context, Uri url) async {
  if (!await launchUrl(url)) {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("URL not Found !")));
  }
}

customDialog(BuildContext context,
    {String? title, String? content, String? img, String? url}) {
  showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              title!,
              style: tspFontP.copyWith(fontWeight: FontWeight.bold),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  content!,
                  style: tspFontP.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                CustomCacheImg(
                  url: img!,
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Uri uri = Uri.parse(url!);
                  _launchURL(context, uri);
                },
                child: Text(
                  "Go",
                  style: tspFontP.copyWith(color: tspColorThird),
                ),
                style: ElevatedButton.styleFrom(
                  primary: tspColorPrime,
                ),
              )
            ],
          ),
        );
      });
}
