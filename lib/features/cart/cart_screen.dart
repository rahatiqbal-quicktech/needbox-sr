import 'package:flutter/material.dart';
import 'package:needbox_sr/features/cart/widgets/cart_summary_widget.dart';
import 'package:needbox_sr/features/cart/widgets/product_card_widget.dart';
import 'package:needbox_sr/shared/widgets/custom_back_button.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/config.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: const KText(
          text: "Cart",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          fontSize: 18,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            sizeH10,
            Padding(
              padding: paddingH10,
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: ((context, index) {
                  // final item = cartC.cartItem[index];
                  return productCardWidget();
                }),
              ),
            ),
            const Divider(),
            cardSummaryWidget(),
          ],
        ),
      ),
    );
  }
}
