class SupportModel {
  int? status;
  List<SupportData>? data;
  String? message;

  SupportModel({this.status, this.data, this.message});

  SupportModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SupportData>[];
      json['data'].forEach((v) {
        data!.add(new SupportData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class SupportData {
  int? supportId;
  String? supportTitle;
  String? supportAdminStatus;
  String? supportCreatedAt;
  String? supportUpdatedAt;
  String? supportDeletedAt;

  SupportData(
      {this.supportId,
        this.supportTitle,
        this.supportAdminStatus,
        this.supportCreatedAt,
        this.supportUpdatedAt,
        this.supportDeletedAt});

  SupportData.fromJson(Map<String, dynamic> json) {
    supportId = json['support_id'];
    supportTitle = json['support_title'];
    supportAdminStatus = json['support_admin_status'];
    supportCreatedAt = json['support_created_at'];
    supportUpdatedAt = json['support_updated_at'];
    supportDeletedAt = json['support_deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['support_id'] = this.supportId;
    data['support_title'] = this.supportTitle;
    data['support_admin_status'] = this.supportAdminStatus;
    data['support_created_at'] = this.supportCreatedAt;
    data['support_updated_at'] = this.supportUpdatedAt;
    data['support_deleted_at'] = this.supportDeletedAt;
    return data;
  }
}
