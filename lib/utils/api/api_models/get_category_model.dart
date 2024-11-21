class GetCategoryModel {
  String? message;
  List<GetCategoryData>? data;
  String? status;

  GetCategoryModel({this.message, this.data, this.status});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new GetCategoryData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class GetCategoryData {
  String? id;
  String? categoryName;
  String? dateTime;
  String? image;

  GetCategoryData({this.id, this.categoryName, this.dateTime, this.image});

  GetCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    dateTime = json['date_time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['date_time'] = this.dateTime;
    data['image'] = this.image;
    return data;
  }
}
