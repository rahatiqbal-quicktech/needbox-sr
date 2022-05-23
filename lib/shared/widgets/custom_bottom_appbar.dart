// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:needbox_sr/features/dashboard/dashboard_screen.dart';
import 'package:needbox_sr/features/products/products_screen.dart';
import 'package:needbox_sr/features/profile/profile_screen.dart';

import 'package:needbox_sr/shared/widgets/k_text_widget.dart';
import 'package:needbox_sr/shared/widgets/sidebar.dart';
import 'package:needbox_sr/utils/config.dart';

import '../../utils/colors.dart';

class CustomBottomAppBar extends StatefulWidget {
  final String? userAccessToken;

  const CustomBottomAppBar({this.userAccessToken, Key? key}) : super(key: key);

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  //

  //
  int _currentTab = 1;
  String _currentTabName = 'Dashboard';

  Widget _currentScreens = DashBoardScreen();
  final PageStorageBucket bucket = PageStorageBucket();

  Future<bool> willPopCallback(BuildContext context) async {
    final completer = Completer<bool>();

    completer.complete(false);
    return completer.future;
  }

  Future<bool> _willPop(BuildContext context) {
    final completer = Completer<bool>();
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Are you sure want to exit?'),
                ),
                MaterialButton(
                    child: const Text('YES'),
                    onPressed: () {
                      completer.complete(true);
                      Navigator.of(context).pop();
                    }),
                MaterialButton(
                    child: const Text('NO'),
                    onPressed: () {
                      completer.complete(true);
                    }),
              ],
            ),
          );
        });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 0.1,
          title: KText(
            text: _currentTabName,
            fontSize: 16,
          ),
        ),
        body: PageStorage(
          bucket: bucket,
          child: _currentScreens,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CircleAvatar(
            backgroundColor: white,
            radius: 32,
            child: CircleAvatar(
              backgroundColor: orange,
              radius: 29,
              child: customButton(
                onTap: () {
                  setState(() {
                    // _currentScreens = UploadProductPage(
                    //   isBackEnable: false,
                    // );
                    _currentScreens = ProductsScreen();
                    _currentTab = 2;
                    _currentTabName = 'Products';
                  });
                },
                iconData: Icons.add,
                isTitleHide: true,
                title: '',
                color: white,
                fontSize: _currentTab == 2 ? 12 : 10,
                iconSize: 30,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(.20),
                spreadRadius: 20,
                blurRadius: 100,
              ),
            ],
          ),
          padding: paddingH20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customButton(
                onTap: () {
                  setState(() {
                    _currentScreens = DashBoardScreen();
                    _currentTab = 1;
                    _currentTabName = 'Dashboard';
                  });
                },
                iconData: Icons.dashboard_outlined,
                title: 'Dashboard',
                color: _currentTab == 1 ? orange : black54,
                fontSize: _currentTab == 1 ? 12 : 10,
                iconSize: _currentTab == 1 ? 30 : 25,
              ),
              sizeW30,
              customButton(
                onTap: () {
                  setState(() {
                    _currentScreens = ProfileScreen();
                    _currentTabName = 'Profile';
                    _currentTab = 3;
                  });
                },
                iconData: Icons.person_outline,
                title: 'Profile',
                color: _currentTab == 3 ? orange : black54,
                fontSize: _currentTab == 3 ? 12 : 10,
                iconSize: _currentTab == 3 ? 30 : 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  customButton({
    required void Function()? onTap,
    required IconData iconData,
    required String title,
    required Color color,
    required double iconSize,
    required double fontSize,
    bool? isTitleHide,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          width: 70,
          alignment: Alignment.center,
          // color: orange,
          child: isTitleHide == true
              ? Icon(
                  iconData,
                  color: color,
                  size: iconSize,
                )
              : Column(
                  children: [
                    Icon(
                      iconData,
                      color: color,
                      size: iconSize,
                    ),
                    sizeH5,
                    KText(
                      text: title,
                      fontSize: fontSize,
                      color: color,
                      fontFamily: robotoRegular,
                    ),
                  ],
                ),
        ),
      );
}
