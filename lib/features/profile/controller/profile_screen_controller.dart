import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:needbox_sr/features/profile/models/profile_details_model.dart';
import 'package:needbox_sr/features/profile/service/profile_screen_service.dart';

class ProfileScreenController extends GetxController {
  var profileDetails = ProfileDetailsModel().obs;
  var box = GetStorage();
  getProfileDetails() async {
    var authToken = box.read('token');
    var temp =
        await ProfileScreenService().getProfilSeScreenDetails(token: authToken);
    if (temp != null) {
      profileDetails.value = temp;
    }
  }
}
