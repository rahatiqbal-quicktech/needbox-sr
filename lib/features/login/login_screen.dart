import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/login/service/login_service.dart';
import 'package:needbox_sr/shared/widgets/custom_bottom_appbar.dart';
import 'package:needbox_sr/shared/widgets/custom_formfield_widget.dart';
import 'package:needbox_sr/shared/widgets/whitespace.dart';
import 'package:needbox_sr/utils/config.dart';

import '../../shared/widgets/k_text_widget.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final sellerPhone = TextEditingController();
  final sellerpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Scaffold(
          body: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              Center(
                child: Padding(
                  padding: paddingH10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      whitespace(context, 5, 0),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          appLogo,
                          height: 130,
                        ),
                      ),
                      sizeH20,
                      CustomFormField(
                        hintText: '01712345678',
                        titleText: 'Phone',
                        controller: sellerPhone,
                        // onChanged: loginC.sellerPhone,
                      ),
                      sizeH20,
                      CustomFormField(
                        hintText: '. . . . . . . .',
                        titleText: 'Password',
                        controller: sellerpassword,
                        isPassWordForm: true,
                      ),
                      sizeH30,
                      GestureDetector(
                        onTap: () {
                          if (sellerPhone.text.isEmpty ||
                              sellerpassword.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Field Empty");
                          } else {
                            // loginC.loginUser();
                            // Get.to(() => CustomBottomAppBar());
                            LoginService().login(
                                email: sellerPhone.text,
                                password: sellerpassword.text);
                          }
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: white54),
                            borderRadius: borderRadiusC10,
                            color: orange,
                          ),
                          child: const KText(
                            text: 'LOGIN',
                            fontSize: 16,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
