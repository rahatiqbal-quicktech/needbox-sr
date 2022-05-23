import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/shared/widgets/cached_networkimage_widget.dart';
import 'package:needbox_sr/shared/widgets/custom_back_button.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';

class ImageViewScreen extends StatelessWidget {
  final String image;
  final String? title;

  const ImageViewScreen({
    Key? key,
    required this.image,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: KText(
          text: title == null ? '' : title.toString(),
          fontSize: 16,
        ),
      ),
      body: CachedNetworkImageWidget(
        height: Get.height,
        width: Get.width,
        fit: BoxFit.contain,
        imageUrl: image,
      ),
    );
  }
}
