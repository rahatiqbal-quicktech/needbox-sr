import 'package:flutter/material.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';

customListTile({
  required double height,
  required String title,
  required String contentTitle,
  bool? isImage,
}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      border: Border.all(
        color: grey.shade200,
      ),
    ),
    child: Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: KText(
            text: title,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: height,
          width: .7,
          color: grey.shade200,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: isImage == true
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      contentTitle,
                      scale: 3,
                    ),
                  ),
                )
              : KText(
                  text: contentTitle,
                  fontSize: 14,
                ),
        ),
      ],
    ),
  );
}
