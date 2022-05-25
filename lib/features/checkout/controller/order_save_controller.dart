import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/profile/models/profile_details_model.dart';

import 'package:needbox_sr/shared/controllers/cart/cart_controller.dart';
import 'package:needbox_sr/shared/feature/get_storage_profile.dart';
import 'package:needbox_sr/shared/modles/cart/cart_models.dart';
import 'package:needbox_sr/shared/widgets/custom_bottom_appbar.dart';
import 'package:needbox_sr/shared/widgets/snackbar_widget.dart';
import 'package:needbox_sr/utils/service_config.dart';

class OrderSaveController extends GetxController {
  createNewOrder({
    required CartModels item,
    required paymentType,
    required totalPrice,
    required districsId,
    required areaId,
    required shippingCharge,
    required ProfileDetailsModel userInfo,
  }) async {
    String endpoint = "/api/v1/sr/order/save";
    String fullUrl = baseUrl + endpoint;
    try {
      // final sharedPreferences = await SharedPreferences.getInstance();
      // var token = sharedPreferences.getString('accessToken');
      var token = GetStorageProfile().getToken();
      final dio = Dio();
      final res = await dio.post(
        fullUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          "cart": [
            {
              "product_id": item.id,
              "product_name": item.productname,
              "sellerid": 1,
              "product_price": item.proNewprice,
              "quantity": item.quantity.toString(),
              "product_size": "",
              "product_color": item.productColor,
            },
          ],
          "name": userInfo.profile?.name,
          "phone": userInfo.profile?.name,
          "district": districsId,
          "area": areaId,
          "stateaddress": "Road, 4/a",
          "houseaddress": "Mirpur, Dhaka",
          "fulladdress": userInfo.profile?.address,
          "zipcode": "1212",
          "totalprice": totalPrice,
          "shippingfee": shippingCharge,
          "discount": "",
          "additionalshipping": "",
          "couponcode": "",
          "totalproductpoint": "",
          "usemypoint": "",
          "paymentType": paymentType,
        },
      );

      if (res.statusCode == 200) {
        snackBarWidget(
          title: 'Success',
          message: 'Order Place Successfully!',
          isRed: false,
        );
        print('Total Order:-');
        print(totalPrice);
        print('Order ID:-');
        print(res.data['order']['ordertrack']);

        CartController().cartItem.clear();
        Get.offAll(CustomBottomAppBar());
        // OrderListController().orderList.clear();
        // return res;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
