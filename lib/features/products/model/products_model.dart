// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.status,
    this.products,
  });

  String? status;
  Products? products;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        status: json["status"],
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "products": products?.toJson(),
      };
}

class Products {
  Products({
    this.currentPage,
    this.data,
    this.from,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  int? from;
  int? to;
  int? total;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        from: json["from"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "from": from,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
