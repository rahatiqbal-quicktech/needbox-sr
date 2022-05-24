// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:needbox_sr/features/profile_edit/service/edit_profile_service.dart';
import 'package:needbox_sr/features/profile_edit/service/user_profile_upload.dart';
import 'package:needbox_sr/shared/animations/loading_animation.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';
import 'package:needbox_sr/shared/widgets/custom_back_button.dart';
import 'package:needbox_sr/shared/widgets/custom_formfield_widget.dart';
import 'package:needbox_sr/shared/widgets/custom_primary_button.dart';
import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/shared/widgets/snackbar_widget.dart';
import 'package:needbox_sr/utils/colors.dart';
import 'package:needbox_sr/utils/config.dart';
import 'package:needbox_sr/utils/service_config.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with AllControllers {
  final nameTextC = TextEditingController();
  final phoneTextC = TextEditingController();
  final fullAddressTextC = TextEditingController();
  var box = GetStorage();
  String? name;
  String? address;
  @override
  void initState() {
    nameTextC.text = box.read('name');
    fullAddressTextC.text = box.read('address');
    name = box.read('name');
    address = box.read('address');
    super.initState();
  }

  //for image upload
  File? image;
  final pickImage = ImagePicker();
  var isUploading = false;

  Future getImage() async {
    PickedFile? pickedFile =
        await pickImage.getImage(source: ImageSource.gallery);
    var imageFile = File(pickedFile!.path);

    if (imageFile.path.isNotEmpty) {
      setState(() {
        isUploading = true;
      });
      print('upload started');
      var res1 = await UserProfileUpload()
          .sendForm(baseUrl + '/api/v1/sr/profile/update', {
        "name": name,
        "address": address,
      }, {
        "image": imageFile
      });
      print("res-1 $res1");

      Fluttertoast.showToast(msg: "Image uploaded");

      setState(() {
        image = imageFile;
      });
      setState(() {
        isUploading = false;
      });
    } else {
      Fluttertoast.showToast(msg: "Image upload failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: customBackButton(),
        title: const KText(
          text: 'Edit Profile',
          fontSize: 18,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Container(
            color: white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: grey.shade100,
                            width: .5,
                          ),
                        ),
                        child: isUploading == true
                            ? const LoadingAnimation()
                            : image != null
                                ? CircleAvatar(
                                    radius: 45,
                                    backgroundColor: white,
                                    backgroundImage: FileImage(
                                      image as File,
                                    ),
                                    // child: Image.file(
                                    //   image as File,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  )
                                : Obx(() {
                                    return CircleAvatar(
                                      radius: 45,
                                      backgroundColor: white,
                                      backgroundImage: NetworkImage(
                                        imageBaseUrl +
                                            "${profileScreenController.profileDetails.value.profile?.image}",
                                      ),
                                    );
                                  }),
                      ),
                      Positioned(
                        right: -20,

                        // bottom: 40,
                        child: isUploading == true
                            ? Container()
                            : IconButton(
                                onPressed: getImage,
                                icon: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.black26,
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 15,
                                    color: white,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                  sizeH30,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeH10,
                      CustomFormField(
                        height: 50,
                        hintText: 'Name',
                        controller: nameTextC,
                        titleText: 'Name',
                      ),
                      sizeH10,
                      CustomFormField(
                        height: 50,
                        hintText: 'Full Address',
                        controller: fullAddressTextC,
                        titleText: 'Full Address',
                      ),
                      sizeH30,
                      customPrimaryButton(
                        onTap: () {
                          if (nameTextC.text.isEmpty ||
                              fullAddressTextC.text.isEmpty) {
                            snackBarWidget(
                              title: 'Opps!',
                              message: 'Field Empty!',
                              isRed: true,
                            );
                          } else {
                            EditProfileService().updateProfile(
                                name: nameTextC.text,
                                address: fullAddressTextC.text);
                          }
                          // nameTextC.clear();
                          // phoneTextC.clear();
                          // fullAddressTextC.clear();
                        },
                        color: orangeO50,
                        height: 40,
                        title: 'Save',
                        titleColor: white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        child: const KText(text: ''),
                      ),
                      sizeH10,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
