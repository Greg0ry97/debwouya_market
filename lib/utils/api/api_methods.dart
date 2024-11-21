import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../http_methods.dart';
import 'api_key_constants.dart';
import 'api_models/business_types_model.dart';
import 'api_models/get_about_us_model.dart';
import 'api_models/get_category_model.dart';
import 'api_models/my_products_model.dart';
import 'api_models/user_model.dart';

class ApiMethods {
  static Future<UserModel?> register(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfRegister,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> login(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfLogin,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> changePassword(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfChangePassword,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> sendForgotPasswordOtp(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfSendForgotPasswordOtp,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> checkOtp(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfCheckOtp,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> supportTickets(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfSupportTickets,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> getProfile(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetProfile,
        context: context,
        bodyParams: bodyParams,
        wantSnackBar: false);
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<MyProductsModel?> myProducts(
      {required BuildContext context, Map<String, dynamic>? bodyParams}) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfMyProducts,
        context: context,
        bodyParams: bodyParams);
    if (response != null) {
      return MyProductsModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> updateProfile({
    required BuildContext context,
    Map<String, dynamic>? bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfUpdateProfile,
      context: context,
      bodyParams: bodyParams,
      image: image,
      imageKey: imageKey,
    );
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<BusinessTypesModel?> businessTypes(
      {required BuildContext context}) async {
    http.Response? response = await MyHttp.getMethod(
        url: ApiUrlConstants.endPointOfBusinessTypes, context: context);
    if (response != null) {
      return BusinessTypesModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<GetCategoryModel?> getCategory(
      {required BuildContext context}) async {
    http.Response? response = await MyHttp.getMethod(
        url: ApiUrlConstants.endPointOfGetCategory, context: context);
    if (response != null) {
      return GetCategoryModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<GetAboutUsModel?> getAboutUs(
      {required BuildContext context}) async {
    http.Response? response = await MyHttp.getMethod(
        url: ApiUrlConstants.endPointOfGetAboutUs, context: context);
    if (response != null) {
      return GetAboutUsModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<GetAboutUsModel?> getPrivacyPolicy(
      {required BuildContext context}) async {
    http.Response? response = await MyHttp.getMethod(
        url: ApiUrlConstants.endPointOfGetPrivacyPolicy, context: context);
    if (response != null) {
      return GetAboutUsModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> createBusiness({
    required BuildContext context,
    Map<String, dynamic>? bodyParams,
    required Map<String, File> imageMap,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfCreateBusiness,
      context: context,
      bodyParams: bodyParams,
      imageMap: imageMap,
    );
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<UserModel?> productsCreate({
    required BuildContext context,
    Map<String, dynamic>? bodyParams,
    String? imageKey,
    List<File>? images,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfProductsCreate,
      context: context,
      bodyParams: bodyParams,
      imageKey: imageKey,
      images: images,
    );
    if (response != null) {
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
