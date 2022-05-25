import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:needbox_sr/features/dashboard/widgets/dashboard_widget.dart';
import 'package:needbox_sr/shared/controllers/all_controlelrs.dart';
import 'package:needbox_sr/shared/widgets/whitespace.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with AllControllers {
  @override
  void initState() {
    super.initState();
    dashboardController.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Obx(() {
        var data = dashboardController.dashboardModel.value;
        return dashboardController.dataRecieved.value
            ? ListView(
                shrinkWrap: true,
                children: [
                  whitespace(context, 3, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dashboardWidget(
                          icon: Icons.pending_actions_outlined,
                          color1: "#7889fd",
                          color2: "#804df8",
                          title: "Pending",
                          content: "${data.pending}",
                          size: size),
                      dashboardWidget(
                          icon: Icons.check,
                          color1: "#f7801f",
                          color2: "#fd5d2c",
                          title: "Accepted",
                          content: "${data.deliverd}",
                          size: size),
                    ],
                  ),
                  whitespace(context, 2, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dashboardWidget(
                          icon: Icons.hail,
                          color1: "#f84d39",
                          color2: "#e82c64",
                          title: "Picked",
                          content: "${data.picked}",
                          size: size),
                      dashboardWidget(
                          icon: Icons.sync,
                          color1: "#1494ff",
                          color2: "#21ccfe",
                          title: "In Process",
                          content: "${data.inprocess}",
                          size: size),
                    ],
                  ),
                  whitespace(context, 2, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dashboardWidget(
                          icon: Icons.update,
                          color1: "##5f2c82",
                          color2: "##49a09d",
                          title: "Rescheduled",
                          content: "Unavailable",
                          size: size),
                      dashboardWidget(
                          icon: Icons.send_time_extension,
                          color1: "##283048",
                          color2: "##859398",
                          title: "Delivered",
                          content: "${data.deliverd}",
                          size: size),
                    ],
                  ),
                  whitespace(context, 2, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      dashboardWidget(
                          icon: Icons.disabled_by_default,
                          color1: "##134E5E",
                          color2: "##71B280",
                          title: "Cancelled",
                          content: "${data.cancelled}",
                          size: size),
                      dashboardWidget(
                          icon: Icons.keyboard_return,
                          color1: "##1F1C2C",
                          color2: "##928DAB",
                          title: "Returned",
                          content: "${data.returned}",
                          size: size),
                    ],
                  ),
                  whitespace(context, 10, 0),
                ],
              )
            : const Center(child: CircularProgressIndicator());
      }),
    ));
  }
}
