import 'package:firemax_football/constants/constant.dart';
import 'package:firemax_football/services/url.dart';
import 'package:firemax_football/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';

customDialog(
  BuildContext context, {
  String? title,
  String? content,
  String? img,
  Uri? url,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title!,
          style: Theme.of(context).textTheme.headline3,
        ),
        content: Text(
          content!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          CustomButton(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Close",
            ),
          ),
          CustomButton(
            onTap: () {
              ExternalUrl.launchURL(context, url!);
            },
            color: Constant.xColorAccents,
            child: Text(
              "Update Now",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Constant.xColorDark),
            ),
          )
        ],
      );
    },
  );
}

// customDialog(BuildContext context,
//     {String? title, String? content, String? img, String? url}) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return WillPopScope(
//           onWillPop: () async => false,
//           child: AlertDialog(
//             title: Text(title!, style: xFontH3),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(content!, style: xFontP),
//                 const SizedBox(height: 10),
//                 CustomCacheImg(
//                   url: img!,
//                   height: 200,
//                   width: 300,
//                   fit: BoxFit.cover,
//                 )
//               ],
//             ),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Uri uri = Uri.parse(url!);
//                   _launchURL(context, uri);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: xColorVariant,
//                 ),
//                 child: Text("Go", style: xFontP),
//               )
//             ],
//           ),
//         );
//       });
// }
