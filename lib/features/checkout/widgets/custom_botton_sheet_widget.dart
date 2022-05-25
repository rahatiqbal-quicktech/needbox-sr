import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

customBottomSheetWidget({
  required BuildContext context,
  required double height,
  required Widget child,
}) =>
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: height,
          width: Get.width,
          decoration: const BoxDecoration(
            // color: green50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizeH10,
                Container(
                  height: 3,
                  width: 70,
                  decoration: BoxDecoration(
                    color: grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                sizeH30,
                child,
              ],
            ),
          ),
        );
      },
    );
