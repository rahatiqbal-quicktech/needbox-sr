// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) =>
    OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.status,
    this.orders,
  });

  String? status;
  List<Order>? orders;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.orderIdPrimary,
    this.customerId,
    this.ordertrack,
    this.orderTotal,
    this.cshippingfee,
    this.cdiscount,
    this.offertype,
    this.additionalshipping,
    this.shippingId,
    this.orderSubtotal,
    this.totalproductpoint,
    this.usemypoint,
    this.orderStatus,
    this.quickDelivery,
    this.area,
    this.deliverymanId,
    this.agentId,
    this.srId,
    this.srcommision,
    this.createdAt,
    this.updatedAt,
    this.shipping,
    this.status,
  });

  int? orderIdPrimary;
  int? customerId;
  String? ordertrack;
  int? orderTotal;
  int? cshippingfee;
  int? cdiscount;
  String? offertype;
  int? additionalshipping;
  int? shippingId;
  int? orderSubtotal;
  int? totalproductpoint;
  int? usemypoint;
  String? orderStatus;
  int? quickDelivery;
  int? area;
  int? deliverymanId;
  dynamic agentId;
  int? srId;
  int? srcommision;
  DateTime? createdAt;
  DateTime? updatedAt;
  Shipping? shipping;
  Status? status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderIdPrimary: json["orderIdPrimary"],
        customerId: json["customerId"],
        ordertrack: json["ordertrack"],
        orderTotal: json["orderTotal"],
        cshippingfee: json["cshippingfee"],
        cdiscount: json["cdiscount"],
        offertype: json["offertype"],
        additionalshipping: json["additionalshipping"] == null
            ? null
            : json["additionalshipping"],
        shippingId: json["shippingId"],
        orderSubtotal: json["orderSubtotal"],
        totalproductpoint: json["totalproductpoint"],
        usemypoint: json["usemypoint"],
        orderStatus: json["orderStatus"],
        quickDelivery: json["quickDelivery"],
        area: json["area"],
        deliverymanId:
            json["deliveryman_id"] == null ? null : json["deliveryman_id"],
        agentId: json["agent_id"],
        srId: json["sr_id"],
        srcommision: json["srcommision"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shipping: Shipping.fromJson(json["shipping"]),
        status: Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "orderIdPrimary": orderIdPrimary,
        "customerId": customerId,
        "ordertrack": ordertrack,
        "orderTotal": orderTotal,
        "cshippingfee": cshippingfee,
        "cdiscount": cdiscount,
        "offertype": offertype,
        "additionalshipping":
            additionalshipping == null ? null : additionalshipping,
        "shippingId": shippingId,
        "orderSubtotal": orderSubtotal,
        "totalproductpoint": totalproductpoint,
        "usemypoint": usemypoint,
        "orderStatus": orderStatus,
        "quickDelivery": quickDelivery,
        "area": area,
        "deliveryman_id": deliverymanId == null ? null : deliverymanId,
        "agent_id": agentId,
        "sr_id": srId,
        "srcommision": srcommision,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shipping": shipping?.toJson(),
        "status": status?.toJson(),
      };
}

class Shipping {
  Shipping({
    this.id,
    this.name,
    this.phone,
    this.district,
    this.area,
    this.stateaddress,
    this.customerid,
    this.houseaddress,
    this.fulladdress,
    this.zipcode,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? phone;
  String? district;
  String? area;
  String? stateaddress;
  String? customerid;
  String? houseaddress;
  String? fulladdress;
  String? zipcode;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        district: json["district"],
        area: json["area"],
        stateaddress: json["stateaddress"],
        customerid: json["customerid"],
        houseaddress: json["houseaddress"],
        fulladdress: json["fulladdress"],
        zipcode: json["zipcode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "district": district,
        "area": area,
        "stateaddress": stateaddress,
        "customerid": customerid,
        "houseaddress": houseaddress,
        "fulladdress": fulladdress,
        "zipcode": zipcode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Status {
  Status({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
