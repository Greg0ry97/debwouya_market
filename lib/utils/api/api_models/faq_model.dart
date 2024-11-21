class FaqModel {
  int? status;
  List<FaqData>? data;
  String? message;

  FaqModel({this.status, this.data, this.message});

  FaqModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FaqData>[];
      json['data'].forEach((v) {
        data!.add(new FaqData.fromJson(v));
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

class FaqData {
  int? faqId;
  String? faqTitle;
  String? faqDescription;
  String? faqAdminStatus;
  String? faqCreatedAt;
  String? faqUpdatedAt;
  Null? faqDeletedAt;

  FaqData(
      {this.faqId,
        this.faqTitle,
        this.faqDescription,
        this.faqAdminStatus,
        this.faqCreatedAt,
        this.faqUpdatedAt,
        this.faqDeletedAt});

  FaqData.fromJson(Map<String, dynamic> json) {
    faqId = json['faq_id'];
    faqTitle = json['faq_title'];
    faqDescription = json['faq_description'];
    faqAdminStatus = json['faq_admin_status'];
    faqCreatedAt = json['faq_created_at'];
    faqUpdatedAt = json['faq_updated_at'];
    faqDeletedAt = json['faq_deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faq_id'] = this.faqId;
    data['faq_title'] = this.faqTitle;
    data['faq_description'] = this.faqDescription;
    data['faq_admin_status'] = this.faqAdminStatus;
    data['faq_created_at'] = this.faqCreatedAt;
    data['faq_updated_at'] = this.faqUpdatedAt;
    data['faq_deleted_at'] = this.faqDeletedAt;
    return data;
  }
}
