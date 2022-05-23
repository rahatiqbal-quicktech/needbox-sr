import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

dashboardWidget(
        {required String color1,
        required String color2,
        required title,
        required content,
        IconData? icon,
        required Size size}) =>
    Container(
      height: size.height * 20,
      width: size.width * 41,
      decoration: BoxDecoration(
        borderRadius: borderRadiusC10,
        gradient: LinearGradient(
          colors: [
            HexColor(color1),
            HexColor(color2),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: grey.shade200,
          ),
          sizeH5,
          KText(
            text: title,
            color: white54,
          ),
          sizeH5,
          KText(
            text: content,
            fontSize: 22,
            color: white,
          ),
        ],
      ),
    );
