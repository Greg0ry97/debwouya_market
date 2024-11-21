class MyProductsModel {
  String? status;
  List<MyProductsData>? data;
  String? messages;

  MyProductsModel({this.status, this.data, this.messages});

  MyProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <MyProductsData>[];
      json['data'].forEach((v) {
        data!.add(new MyProductsData.fromJson(v));
      });
    }
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['messages'] = this.messages;
    return data;
  }
}

class MyProductsData {
  String? productId;
  String? productName;
  String? productPrice;
  String? productDescription;
  List<String>? images;
  String? createdAt;
  String? userId;
  String? productStock;

  MyProductsData(
      {this.productId,
        this.productName,
        this.productPrice,
        this.productDescription,
        this.images,
        this.createdAt,
        this.userId,
        this.productStock});

  MyProductsData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productDescription = json['product_description'];
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    userId = json['user_id'];
    productStock = json['product_stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_description'] = this.productDescription;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['product_stock'] = this.productStock;
    return data;
  }
}
