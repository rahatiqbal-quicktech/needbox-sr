import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:needbox_sr/shared/widgets/k_text_widget.dart';

import '../../utils/colors.dart';

class EmptyAnimation extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final String? twoTitle;

  const EmptyAnimation({
    Key? key,
    this.height,
    this.width,
    this.title,
    this.twoTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/empty.json',
            height: height ?? 300,
            width: width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KText(
                text: title != null ? title.toString() : 'There is no product!',
                color: black54,
              ),
              KText(
                text: twoTitle != null ? twoTitle.toString() : '',
                color: black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
