// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.productdetails,
    this.selectcolors,
    this.selectsizes,
    this.allReview,
    this.productbrand,
  });

  Productdetails? productdetails;
  List<Selectcolor>? selectcolors;
  List<dynamic>? selectsizes;
  List<dynamic>? allReview;
  dynamic productbrand;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        productdetails: Productdetails.fromJson(json["productdetails"]),
        selectcolors: List<Selectcolor>.from(
            json["selectcolors"].map((x) => Selectcolor.fromJson(x))),
        selectsizes: List<dynamic>.from(json["selectsizes"].map((x) => x)),
        allReview: List<dynamic>.from(json["allReview"].map((x) => x)),
        productbrand: json["productbrand"],
      );

  Map<String, dynamic> toJson() => {
        "productdetails": productdetails?.toJson(),
        "selectcolors":
            List<dynamic>.from(selectcolors!.map((x) => x.toJson())),
        "selectsizes": List<dynamic>.from(selectsizes!.map((x) => x)),
        "allReview": List<dynamic>.from(allReview!.map((x) => x)),
        "productbrand": productbrand,
      };
}

class Productdetails {
  Productdetails({
    this.id,
    this.productcat,
    this.productsubcat,
    this.productchildcat,
    this.productbrand,
    this.campaignId,
    this.productname,
    this.slug,
    this.productdiscount,
    this.productnewprice,
    this.productoldprice,
    this.productpoint,
    this.productcode,
    this.additionalshipping,
    this.featureproductdate,
    this.productstyle,
    this.productdetails,
    this.productdetails2,
    this.productquantity,
    this.sellerid,
    this.producttype,
    this.request,
    this.status,
    this.proimage,
    this.productprice,
  });

  int? id;
  int? productcat;
  int? productsubcat;
  int? productchildcat;
  int? productbrand;
  dynamic campaignId;
  String? productname;
  String? slug;
  dynamic productdiscount;
  dynamic productnewprice;
  dynamic productoldprice;
  dynamic productpoint;
  String? productcode;
  dynamic additionalshipping;
  dynamic featureproductdate;
  dynamic productstyle;
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? producttype;
  int? request;
  int? status;
  Proimage? proimage;
  Productprice? productprice;

  factory Productdetails.fromJson(Map<String, dynamic> json) => Productdetails(
        id: json["id"],
        productcat: json["productcat"],
        productsubcat: json["productsubcat"],
        productchildcat: json["productchildcat"],
        productbrand: json["productbrand"],
        campaignId: json["campaign_id"],
        productname: json["productname"],
        slug: json["slug"],
        productdiscount: json["productdiscount"],
        productnewprice: json["productnewprice"],
        productoldprice: json["productoldprice"],
        productpoint: json["productpoint"],
        productcode: json["productcode"],
        additionalshipping: json["additionalshipping"],
        featureproductdate: json["featureproductdate"],
        productstyle: json["productstyle"],
        productdetails: json["productdetails"],
        productdetails2: json["productdetails2"],
        productquantity: json["productquantity"],
        sellerid: json["sellerid"],
        producttype: json["producttype"],
        request: json["request"],
        status: json["status"],
        proimage: Proimage.fromJson(json["proimage"]),
        productprice: Productprice.fromJson(json["productprice"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productcat": productcat,
        "productsubcat": productsubcat,
        "productchildcat": productchildcat,
        "productbrand": productbrand,
        "campaign_id": campaignId,
        "productname": productname,
        "slug": slug,
        "productdiscount": productdiscount,
        "productnewprice": productnewprice,
        "productoldprice": productoldprice,
        "productpoint": productpoint,
        "productcode": productcode,
        "additionalshipping": additionalshipping,
        "featureproductdate": featureproductdate,
        "productstyle": productstyle,
        "productdetails": productdetails,
        "productdetails2": productdetails2,
        "productquantity": productquantity,
        "sellerid": sellerid,
        "producttype": producttype,
        "request": request,
        "status": status,
        "proimage": proimage?.toJson(),
        "productprice": productprice?.toJson(),
      };
}

class Productprice {
  Productprice({
    this.id,
    this.productId,
    this.minQty,
    this.maxQty,
    this.price,
  });

  int? id;
  int? productId;
  int? minQty;
  int? maxQty;
  int? price;

  factory Productprice.fromJson(Map<String, dynamic> json) => Productprice(
        id: json["id"],
        productId: json["product_id"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "min_qty": minQty,
        "max_qty": maxQty,
        "price": price,
      };
}

class Proimage {
  Proimage({
    this.id,
    this.productId,
    this.image,
  });

  int? id;
  int? productId;
  String? image;

  factory Proimage.fromJson(Map<String, dynamic> json) => Proimage(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
      };
}

class Selectcolor {
  Selectcolor({
    this.id,
    this.productId,
    this.colorId,
    this.colorName,
  });

  int? id;
  int? productId;
  int? colorId;
  String? colorName;

  factory Selectcolor.fromJson(Map<String, dynamic> json) => Selectcolor(
        id: json["id"],
        productId: json["product_id"],
        colorId: json["color_id"],
        colorName: json["colorName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color_id": colorId,
        "colorName": colorName,
      };
}
