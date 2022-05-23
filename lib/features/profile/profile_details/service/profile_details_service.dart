// ignore_for_file: avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:needbox_sr/features/profile/profile_details/models/profile_details_model.dart';
import 'package:needbox_sr/shared/feature/get_storage_profile.dart';
import 'package:needbox_sr/shared/widgets/custom_bottom_appbar.dart';
import 'package:needbox_sr/utils/service_config.dart';

class ProfileDetailService {
  getProfileDetails({required String token}) async {
    String fullUrl = baseUrl + profileEndpoint;
    try {
      var response = await http.get(Uri.parse(fullUrl), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var temp = profileDetailsModelFromJson(response.body);
        GetStorageProfile().storeProfileInfo(
            name: "${temp.profile!.name}",
            email: "${temp.profile?.email}",
            phoneNumber: "${temp.profile?.phone}");
        Fluttertoast.showToast(msg: "Successfully Logged In");
        Get.to(() => const CustomBottomAppBar());
      } else {
        Get.snackbar('Error', "Couldn't get user details");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Couldn't get user details");
    }
  }
}
