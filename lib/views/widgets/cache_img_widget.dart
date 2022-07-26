import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:template_spam_playtore/views/widgets/loading_widget.dart';

class CustomCacheImg extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CustomCacheImg(
      {Key? key, required this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: url,
      placeholder: (context, url) => const CustomLoading(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
