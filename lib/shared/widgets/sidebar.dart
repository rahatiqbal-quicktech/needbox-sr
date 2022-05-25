import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:needbox_sr/features/cart/cart_screen.dart';
import 'package:needbox_sr/features/login/login_screen.dart';
import 'package:needbox_sr/features/orders/orders_screen.dart';
import 'package:needbox_sr/features/profile/profile_screen.dart';
import 'package:needbox_sr/features/profile_edit/profile_edit_screen.dart';
import 'package:needbox_sr/shared/feature/get_storage_profile.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

import 'custom_bottom_appbar.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    return Drawer(
      child: ListView(
        children: [
          sizeH20,

          Padding(
            padding: paddingH20,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: orange,
                  backgroundImage: NetworkImage(box.read('profileImage')
                      // "https://www.bastiaanmulder.nl/wp-content/uploads/2013/11/dummy-image-portrait.jpg"
                      ),
                  radius: 25,
                ),
                sizeW20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: "${box.read('name')}",
                      fontSize: 16,
                    ),
                    KText(
                      text: "${box.read('email')}",
                      fontSize: 12,
                      fontFamily: robotoRegular,
                      color: black54,
                    ),
                  ],
                )
              ],
            ),
          ),

          sizeH20,
          const Divider(),
          sizeH20,
          customButton(
            onTap: () => Get.offAll(const CustomBottomAppBar()),
            icons: Ionicons.grid_outline,
            titleText: 'Dashboard',
          ),
          customButton(
            onTap: () => Get.to(() => CartScreen()),
            icons: Ionicons.cart,
            titleText: 'Cart',
          ),

          customButton(
            onTap: () {
              Get.to(() => ProfileScreen());
            },
            icons: Ionicons.accessibility,
            titleText: 'My Profile',
          ),

          customButton(
            onTap: (() => Get.to(const EditProfileScreen())),
            icons: Ionicons.pencil,
            titleText: 'Edit Profile',
          ),

          customButton(
              icons: Ionicons.receipt_outline,
              titleText: 'Orders',
              onTap: () {
                Get.to(() => const OrdersScreen());
              }),

          // customButton(
          //   onTap: (() => Get.to(ProfilePage(isBackEnabled: true))),
          //   icons: Icons.person_outline,
          //   titleText: 'Profile',
          // ),
          sizeH20,
          // CustomDividerWidget(),
          const Divider(),
          sizeH20,
          // customButton(
          //   onTap: () => Null,
          //   icons: Ionicons.lock_open_outline,
          //   titleText: 'Change Password',
          // ),
          customButton(
            onTap: () {
              GetStorageProfile().deleteAllGetStorageData();
              Get.offAll(() => LoginScreen());
            },
            icons: Icons.logout_outlined,
            titleText: 'Logout',
          ),
        ],
      ),
    );
  }

  customButton(
          {required String titleText,
          required IconData icons,
          void Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: paddingH20V20,
          child: Row(
            children: [
              Icon(
                icons,
                color: grey,
                size: 18,
              ),
              sizeW20,
              KText(
                text: titleText,
                fontFamily: robotoRegular,
                color: grey,
                fontSize: 13,
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: orange,
                size: 10,
              ),
            ],
          ),
        ),
      );
}
