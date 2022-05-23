import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/product_details/models/product_details_model.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';

class WholesaleProdctDetailsChart extends StatelessWidget {
  final Productprice? productPriceModel;
  const WholesaleProdctDetailsChart({
    this.productPriceModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 30,
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: black54,
                  ),
                ),
                child: const Center(
                  child: KText(
                    text: 'Quantity',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: black54,
                  ),
                ),
                child: const Center(
                  child: KText(
                    text: 'Price/Unit',
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 2,
            itemBuilder: ((context, index) {
              // final item =
              //     widget.productPricing![index];
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: black54,
                        ),
                      ),
                      child: Center(
                        child: KText(
                          text:
                              "${productPriceModel?.minQty} - ${productPriceModel?.maxQty}",
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: black54,
                        ),
                      ),
                      child: Center(
                        child: KText(
                          text: '৳ ${productPriceModel?.price}',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }))
      ],
    );
  }
}
