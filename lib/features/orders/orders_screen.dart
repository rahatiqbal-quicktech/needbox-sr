import 'package:flutter/material.dart';
import 'package:needbox_sr/features/orders/model/orders_model.dart';
import 'package:needbox_sr/features/orders/service/orders_service.dart';
import 'package:needbox_sr/features/orders/widgets/expanded_text_widget.dart';
import 'package:needbox_sr/shared/animations/loading_animation.dart';
import 'package:needbox_sr/shared/widgets/custom_back_button.dart';
import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: const KText(
          text: 'All Orders',
          fontSize: 16,
        ),
      ),
      body: Padding(
        padding: paddingH10,
        child: ListView(
          children: [
            sizeH10,
            FutureBuilder<OrdersModel?>(
                future: OrdersService().getOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data?.orders!.length,
                      itemBuilder: ((context, index) {
                        final temp = snapshot.data?.orders![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CustomCardWidget(
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  padding: paddingH10,
                                  decoration: BoxDecoration(
                                    color: orangeO50,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      expandedTextWidget(
                                        title: 'Order ID',
                                        textSize: 12,
                                        colorText: white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      expandedTextWidget(
                                        title: 'Total Order',
                                        textSize: 12,
                                        colorText: white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      expandedTextWidget(
                                        title: 'Status',
                                        textSize: 12,
                                        colorText: white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      // expandedTextWidget(
                                      //   title: 'Invoice',
                                      //   textSize: 12,
                                      //   colorText: white,
                                      //   fontWeight: FontWeight.normal,
                                      //   isDividerShow: false,
                                      // ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  padding: paddingH10,
                                  child: Row(
                                    children: [
                                      expandedTextWidget(
                                        title: "${temp!.ordertrack}",
                                        textSize: 16,
                                        colorText: black,
                                      ),
                                      expandedTextWidget(
                                        title: "${temp.orderTotal}",
                                        textSize: 16,
                                        colorText: black,
                                      ),
                                      expandedTextWidget(
                                        title: "${temp.orderStatus}",
                                        textSize: 16,
                                        colorText: black,
                                      ),
                                      // expandedTextWidget(
                                      //   title: 'View',
                                      //   textSize: 16,
                                      //   colorText: black,
                                      //   isDividerShow: false,
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return const LoadingAnimation();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
