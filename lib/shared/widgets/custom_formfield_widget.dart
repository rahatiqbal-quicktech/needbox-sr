import 'package:flutter/material.dart';
import 'package:needbox_sr/utils/config.dart';

import '../../utils/colors.dart';
import 'k_text_widget.dart';

class CustomFormField extends StatelessWidget {
  final String titleText;
  final String hintText;

  final Color? titleColor;
  final bool? isPassWordForm;
  final Color? errorBorderColor;
  final void Function(String)? onChanged;
  final bool? isRequiredField;

  final TextInputType? keyboardType;

  final double? height;
  final TextEditingController controller;
  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.titleText,
    this.titleColor,
    this.isPassWordForm,
    this.isRequiredField,
    this.errorBorderColor,
    this.onChanged,
    this.height,
    this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            KText(
              text: titleText,
              color: titleColor ?? orange,
            ),
            sizeW5,
            isRequiredField == true
                ? const KText(
                    text: '*',
                    color: Colors.red,
                  )
                : const KText(text: ''),
          ],
        ),
        sizeH10,
        SizedBox(
          height: height ?? 45,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            obscureText: isPassWordForm == true ? true : false,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadiusC5,
                  borderSide: BorderSide(
                    color: errorBorderColor != null
                        ? errorBorderColor as Color
                        : orangeO50.withOpacity(.20),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadiusC5,
                  borderSide: BorderSide(
                    color: errorBorderColor != null
                        ? errorBorderColor as Color
                        : orangeO50.withOpacity(.20),
                  ),
                ),
                contentPadding: paddingH10,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: isPassWordForm == true ? 16 : 13,
                  color: grey.shade400,
                )),
          ),
        ),
      ],
    );
  }
}

class CustomExpanedFormField extends StatelessWidget {
  final String titleText;
  final String hintText;

  final Color? titleColor;
  final bool? isPassWordForm;
  final Color? errorBorderColor;
  final void Function(String)? onChanged;
  final bool? isRequiredField;

  final int? maxlines;
  final int? minlines;

  final TextInputType? keyboardType;

  final double? height;
  final TextEditingController controller;
  const CustomExpanedFormField({
    Key? key,
    required this.hintText,
    required this.titleText,
    this.titleColor,
    this.isPassWordForm,
    this.isRequiredField,
    this.errorBorderColor,
    this.onChanged,
    this.height,
    this.keyboardType,
    this.minlines,
    this.maxlines,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            KText(
              text: titleText,
              color: titleColor ?? orange,
            ),
            sizeW5,
            isRequiredField == true
                ? const KText(
                    text: '*',
                    color: Colors.red,
                  )
                : const KText(text: ''),
          ],
        ),
        sizeH10,
        SizedBox(
          child: TextFormField(
            keyboardType: keyboardType,
            maxLines: maxlines,
            minLines: minlines,
            controller: controller,
            onChanged: onChanged,
            obscureText: isPassWordForm == true ? true : false,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadiusC5,
                  borderSide: BorderSide(
                    color: errorBorderColor != null
                        ? errorBorderColor as Color
                        : orangeO50.withOpacity(.20),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: borderRadiusC5,
                  borderSide: BorderSide(
                    color: errorBorderColor != null
                        ? errorBorderColor as Color
                        : orangeO50.withOpacity(.20),
                  ),
                ),
                contentPadding: paddingH10,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: isPassWordForm == true ? 16 : 13,
                  color: grey.shade400,
                )),
          ),
        ),
      ],
    );
  }
}
