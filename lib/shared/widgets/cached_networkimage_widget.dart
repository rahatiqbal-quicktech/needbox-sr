// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:needbox_sr/shared/animations/loading_animation.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  String imageUrl;

  double? height;
  double? width;
  BoxFit? fit;
  bool? isImgCircular;

  CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.isImgCircular,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: isImgCircular == true
          ? BorderRadius.circular(10)
          : BorderRadius.circular(0),
      child: CachedNetworkImage(
        // imageUrl: imageBaseUrl + imageUrl,
        imageUrl: imageUrl,
        height: height ?? 50,
        width: width ?? 50,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Center(
          child: LoadingAnimation(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
