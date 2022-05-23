// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.pending,
    this.accepted,
    this.picked,
    this.inprocess,
    this.deliverd,
    this.cancelled,
    this.returned,
  });

  int? pending;
  int? accepted;
  int? picked;
  int? inprocess;
  int? deliverd;
  int? cancelled;
  int? returned;

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        pending: json["pending"],
        accepted: json["accepted"],
        picked: json["picked"],
        inprocess: json["inprocess"],
        deliverd: json["deliverd"],
        cancelled: json["cancelled"],
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "pending": pending,
        "accepted": accepted,
        "picked": picked,
        "inprocess": inprocess,
        "deliverd": deliverd,
        "cancelled": cancelled,
        "returned": returned,
      };
}
