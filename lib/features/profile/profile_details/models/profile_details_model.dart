// To parse this JSON data, do
//
//     final profileDetailsModel = profileDetailsModelFromJson(jsonString);

import 'dart:convert';

ProfileDetailsModel profileDetailsModelFromJson(String str) =>
    ProfileDetailsModel.fromJson(json.decode(str));

String profileDetailsModelToJson(ProfileDetailsModel data) =>
    json.encode(data.toJson());

class ProfileDetailsModel {
  ProfileDetailsModel({
    this.profile,
  });

  Profile? profile;

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProfileDetailsModel(
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.area,
    this.name,
    this.email,
    this.phone,
    this.designation,
    this.address,
    this.image,
    this.commision,
    this.commisiontype,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? area;
  String? name;
  String? email;
  String? phone;
  String? designation;
  String? address;
  String? image;
  int? commision;
  int? commisiontype;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        area: json["area"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        designation: json["designation"],
        address: json["address"],
        image: json["image"],
        commision: json["commision"],
        commisiontype: json["commisiontype"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area,
        "name": name,
        "email": email,
        "phone": phone,
        "designation": designation,
        "address": address,
        "image": image,
        "commision": commision,
        "commisiontype": commisiontype,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
