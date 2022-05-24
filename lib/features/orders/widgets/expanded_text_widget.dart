import 'package:flutter/material.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';

Widget expandedTextWidget({
  required String title,
  double? textSize,
  Color? colorText,
  FontWeight? fontWeight,
  bool? isDividerShow,
  bool? isViewButton,
}) =>
    Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: isViewButton == true
                  ? IconButton(
                      onPressed: () {},
                      icon: const KText(
                        text: 'View',
                      ),
                    )
                  : KText(
                      text: title,
                      fontSize: textSize,
                      color: colorText,
                      fontWeight: fontWeight,
                    ),
            ),
          ),
          isDividerShow == false
              ? Container()
              : Container(
                  height: 50,
                  width: .5,
                  color: grey.shade300,
                ),
        ],
      ),
    );
