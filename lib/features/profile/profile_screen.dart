import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  var box = GetStorage();
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
                    child: CircleAvatar(
                      backgroundColor: white,
                      radius: 40,
                      backgroundImage: NetworkImage(
                        box.read('profileImage'),

                        // "https://www.bastiaanmulder.nl/wp-content/uploads/2013/11/dummy-image-portrait.jpg"
                      ),
                    ),
                  ),
                  sizeH20,
                  customListTile(
                    height: 50,
                    title: 'Name',
                    contentTitle:
                        profile?.name != null ? "${profile?.name}" : "loading",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Email',
                    contentTitle: profile?.email != null
                        ? "${profile?.email}"
                        : "loading",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Phone Number',
                    contentTitle: profile?.phone != null
                        ? "${profile?.phone}"
                        : "loading",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Address',
                    contentTitle: profile?.address != null
                        ? "${profile?.address}"
                        : "loading",
                  ),
                  customListTile(
                    height: 50,
                    title: 'Designation',
                    contentTitle: profile?.designation != null
                        ? "${profile?.designation}"
                        : "loading data",
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
