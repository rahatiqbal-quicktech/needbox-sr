import 'package:get/get.dart';
import 'package:needbox_sr/features/dashboard/model/dashboard_model.dart';
import 'package:needbox_sr/features/dashboard/service/dashboard_service.dart';

class DashboardController extends GetxController {
  RxInt pending = 0.obs;
  var dashboardModel = DashboardModel().obs;
  var dataRecieved = false.obs;

  // int accepted = 0.obs();
  // int picked = 0.obs();
  // int inProcess = 0.obs();
  // int delivered = 0.obs();
  // int cancelled = 0.obs();
  // int returned = 0.obs();
  // Rx<DashboardModel>? test;
  // final anotherTest = Rx<DashboardModel>;

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }

  getDashboardData() async {
    try {
      var temp = await DashboardService().getDashboardData();
      if (temp != null) {
        pending.value = temp.pending!;
        dashboardModel.value = temp;
        dataRecieved(true);
        // accepted = temp.accepted!;
        // picked = temp.picked!;
        // inProcess = temp.inprocess!;
        // delivered = temp.deliverd!;
        // cancelled = temp.cancelled!;
        // returned = temp.returned!;
        // tempModel.value = temp;
      }
    } on Exception catch (e) {
      Get.snackbar("Dashboard Data Error", "$e");
    }
  }
}
