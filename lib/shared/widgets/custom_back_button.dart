// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/utils/colors.dart';

customBackButton({IconData? iconData, void Function()? onTap}) =>
    GestureDetector(
      // onLongPress:
      //     onTap == null ? (() => Get.offAll(CustomBottomAppBar())) : () {},
      onTap: onTap != null ? onTap : () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundColor: grey.shade200,
          child: Icon(
            iconData ?? Icons.arrow_back_ios_new,
            color: orangeO50,
            size: 20,
          ),
        ),
      ),
    );
