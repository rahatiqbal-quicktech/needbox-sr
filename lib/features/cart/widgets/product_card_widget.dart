import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_sr/features/product_details/product_details_screen.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';
import 'package:needbox_sr/shared/controllers/cart/cart_controller.dart';
import 'package:needbox_sr/shared/modles/cart/cart_models.dart';
import 'package:needbox_sr/shared/widgets/cached_networkimage_widget.dart';

import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

productCardWidget({required CartModels item}) {
  final tempCartC = Get.put(CartController());

  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: CustomCardWidget(
      child: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 120,
                width: double.infinity,
              ),
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ProductDetailsScreen());
                  },
                  child: SizedBox(
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: borderRadiusC10,
                      child: CachedNetworkImageWidget(
                        imageUrl: item.image.toString(),
                        fit: BoxFit.cover,
                      ),
                      // Image.asset('assets/img/dummy_image.jpg'),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                right: 10,
                top: 8,
                child: KText(
                  text: "${item.productname}",
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  fontSize: 14,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                left: 110,
                top: 55,
                child: Row(
                  children: [
                    KText(
                      text: '৳ ${item.proNewprice}',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: orangeO50,
                    ),
                    sizeW30,
                    item.productColor == null
                        ? Container()
                        : const KText(
                            text: 'color: ',
                            color: black54,
                            fontSize: 12,
                          ),
                    item.productColor == null
                        ? Container()
                        : KText(
                            text: "${item.productColor}",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 85,
                child: GestureDetector(
                  onTap: () {
                    tempCartC.removeCartItem(
                      id: item.id,
                      cartProducts: item,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Ionicons.trash_outline,
                      size: 20,
                      color: orangeO50.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 85,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        tempCartC.quantityMinus(item);
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: grey.shade300,
                          borderRadius: borderRadiusC5,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    sizeW10,
                    KText(
                      text: "${item.quantity}",
                      fontWeight: FontWeight.w600,
                    ),
                    sizeW10,
                    GestureDetector(
                      onTap: () {
                        tempCartC.quantityAdd(item);
                      },
                      child: Obx(
                        () => item.quantity.value == item.stock
                            ? Container()
                            : Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: grey.shade300,
                                  borderRadius: borderRadiusC5,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
