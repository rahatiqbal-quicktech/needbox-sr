import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';

import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';

import 'widgets/custom_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with AllControllers {
  @override
  void initState() {
    super.initState();
    profileScreenController.getProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        body: ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      children: [
        Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              var profile =
                  profileScreenController.profileDetails.value.profile;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: white,
                      radius: 40,
                      backgroundImage: AssetImage('assets/img/dummy_image.jpg'),
                    ),
                  ),
                  sizeH20,
                  customListTile(
                    height: 50,
                    title: 'Name',
                    contentTitle: "${profile?.name}",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Email',
                    contentTitle: "${profile?.email}",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Phone Number',
                    contentTitle: "${profile?.phone}",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Address',
                    contentTitle: "${profile?.address}",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Designation',
                    contentTitle: "${profile?.designation}",
                  ),
                ],
              );
            }),
          ),
        )
      ],
    ));
  }
}
