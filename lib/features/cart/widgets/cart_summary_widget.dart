import 'package:flutter/material.dart';

import 'package:needbox_sr/shared/widgets/custom_card_widget.dart';
import 'package:needbox_sr/shared/widgets/custom_primary_button.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

cardSummaryWidget() => Padding(
      padding: paddingH10,
      child: CustomCardWidget(
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: orangeO50,
              ),
              alignment: Alignment.center,
              child: const KText(
                text: 'Cart Summary',
                color: white,
                fontSize: 16,
              ),
            ),
            sizeH20,
            Padding(
              padding: paddingH20,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      KText(
                        text: 'Sub Total',
                        fontSize: 12,
                      ),
                      KText(
                        text: "cartC.subTotalAmount.toString()",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: paddingH20,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      KText(
                        text: 'Total',
                        fontSize: 12,
                      ),
                      KText(
                        text: "123",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizeH20,
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: paddingH10,
                child: customPrimaryButton(
                  color: orangeO50,
                  height: 40,
                  title: 'Place Order',
                  fontWeight: FontWeight.w600,
                  child: const KText(text: ''),
                ),
              ),
            ),
            sizeH20,
          ],
        ),
      ),
    );
