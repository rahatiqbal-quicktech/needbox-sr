import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';

customPrimaryButton({
  String? title,
  required Color color,
  Color? titleColor,
  double? fontSize,
  required double height,
  required Widget child,
  bool? isChildEnable,
  FontWeight? fontWeight,
  void Function()? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 40,
        width: Get.width,
        alignment: Alignment.center,
        child: isChildEnable == true
            ? child
            : KText(
                text: title.toString(),
                color: titleColor ?? white,
                fontWeight: fontWeight,
                fontSize: fontSize,
              ),
      ),
    );
