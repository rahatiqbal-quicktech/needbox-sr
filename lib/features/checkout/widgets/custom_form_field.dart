import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';

import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

customFormField({
  required double height,
  required String hintText,
  required String titleText,
  Color? errorBorderColor,
  TextInputType? keyboardType,
  required TextEditingController controller,
  void Function(String)? onChanged,
  bool? isStarEnable,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KText(
              text: titleText,
              color: black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            isStarEnable == true
                ? const KText(
                    text: ' *',
                    color: black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )
                : Container(),
          ],
        ),
        sizeH10,
        SizedBox(
          height: height,
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: errorBorderColor != null
                      ? errorBorderColor
                      : grey.shade300,
                  width: .9,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: errorBorderColor != null
                      ? errorBorderColor
                      : grey.shade300,
                  width: .9,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
