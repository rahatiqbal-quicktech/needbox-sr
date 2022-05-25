// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_prefix;
import 'package:get_storage/get_storage.dart';
import 'package:needbox_sr/features/profile/service/profile_details_service.dart';
import 'package:needbox_sr/shared/feature/get_storage_profile.dart';
import 'package:needbox_sr/shared/widgets/loading_dialogue.dart';
import 'package:needbox_sr/utils/service_config.dart';

class LoginService {
  var dio = Dio();
  final box = GetStorage();
  login({required String email, required String password}) async {
    const String fullUrl = baseUrl + loginEndpoint;
    var loginData = FormData.fromMap({"email": email, "password": password});

    try {
      var response = await dio.post(fullUrl, data: loginData);

      if (response.statusCode == 200) {
        GetStorageProfile().storeToken(token: response.data['token']);
        LoadingDialog().dismiss();
        ProfileDetailService()
            .getProfileDetails(token: "${response.data['token']}");
        // get_prefix.Get.to(() => const CustomBottomAppBar());
      } else {
        LoadingDialog().dismiss();
        Fluttertoast.showToast(msg: "Invalid Credentials");
      }
    } on Exception catch (e) {
      LoadingDialog().dismiss();
      print(e);
      Fluttertoast.showToast(msg: "Invalid Credentials");
    }
  }
}
