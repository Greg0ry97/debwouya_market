class BusinessTypesModel {
  String? status;
  String? message;
  List<BusinessTypesData>? data;

  BusinessTypesModel({this.status, this.message, this.data});

  BusinessTypesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BusinessTypesData>[];
      json['data'].forEach((v) {
        data!.add(new BusinessTypesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusinessTypesData {
  String? typeId;
  String? name;
  bool isSelected = false;
  String? image;
  String? createdAt;

  BusinessTypesData(
      {this.typeId, this.name, this.image, this.createdAt});

  BusinessTypesData.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
