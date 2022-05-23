import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/utils/colors.dart';

class LoadingDialog {
  static Future? dialog;

  void show(BuildContext context) async {
    if (dialog == null) {
      dialog = viewDialog(context);
      await dialog;
    }
  }

  void dismiss() {
    if (dialog != null) {
      dialog = null;
      Get.back();
    }
  }

  Future viewDialog(BuildContext context) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: orange.withOpacity(.7),
              insetPadding: const EdgeInsets.symmetric(horizontal: 100),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 15,
                  ),
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ));
  }
}
