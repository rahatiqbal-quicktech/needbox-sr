import 'package:flutter/material.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';

class SellerListTile extends StatelessWidget {
  const SellerListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: CachedNetworkImageWidget(
      //     imageUrl:
      //         products.sellerinfo!.shoplogo.toString()),
      leading: CircleAvatar(
        backgroundColor: orangeO50,
      ),

      title: const KText(
        text: 'Seller',
        fontSize: 12,
        color: black54,
      ),
      subtitle: const KText(
        text: "",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
