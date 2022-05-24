// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:needbox_sr/features/profile/models/profile_details_model.dart';

import 'package:needbox_sr/utils/service_config.dart';

class ProfileScreenService {
  Future<ProfileDetailsModel?> getProfilSeScreenDetails(
      {required String token}) async {
    String fullUrl = baseUrl + profileEndpoint;
    try {
      var response = await http.get(Uri.parse(fullUrl), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return profileDetailsModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
