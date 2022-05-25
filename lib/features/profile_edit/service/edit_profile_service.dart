// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as get_prefix;
import 'package:needbox_sr/features/profile/service/profile_details_service.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';
import 'package:needbox_sr/shared/feature/get_storage_profile.dart';
import 'package:needbox_sr/utils/service_config.dart';

class EditProfileService with AllControllers {
  var dio = Dio();

  updateProfile({required String name, required String address}) async {
    String token = GetStorageProfile().getToken();
    Map<String, dynamic> data = {'name': name, 'address': address};
    try {
      var formData = FormData.fromMap(data);
      final response = await dio.post(
        baseUrl + "/api/v1/sr/profile/update",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: formData,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Profile Updated");
        ProfileDetailService().getProfileDetails(token: token);
        profileScreenController.getProfileDetails();
        get_prefix.Get.back();
      } else {
        Fluttertoast.showToast(
            msg: "Internal server error. Please try again later");
      }
    } on Exception catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Internal server error. Please try again later");
    }
  }
}
