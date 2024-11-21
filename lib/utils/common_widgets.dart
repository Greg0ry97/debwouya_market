import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import 'api/api_key_constants.dart';
import 'common_methods.dart';
import 'constants/icons_constant.dart';
import 'constants/string_constants.dart';

class CommonWidgets {
  static appBar(
      {String? title,
      bool wantBackButton = true,
      required BuildContext context,
      List<Widget>? actions}) {
    return AppBar(
      elevation: 0,
      shadowColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: wantBackButton
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CommonMethods.appIconsReal(
                assetName: IconConstants.icBack,
                height: 34.px,
                width: 34.px,
              ),
            )
          : null,
      centerTitle: true,
      actions: actions,
      title: Text(
        title ?? '',
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 20.px),
      ),
    );
  }

  static Widget shimmerView(
      {double? height, double? width, required BuildContext context}) {
    return SizedBox(
      height: height ?? 64.px,
      width: width ?? double.infinity,
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.onSecondary.withOpacity(.4.px),
        highlightColor: Theme.of(context).colorScheme.onSecondary,
        child: Container(
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(.4.px),
        ),
      ),
    );
  }

  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton(
      {double? height,
      double? width,
      EdgeInsetsGeometry? buttonMargin,
      EdgeInsetsGeometry? contentPadding,
      double? borderRadius,
      Color? splashColor,
      bool wantContentSizeButton = false,
      Color? buttonColor,
      TextStyle? textStyle,
      required String text,
      Widget? child,
      double? elevation,
      required VoidCallback onPressed,
      required BuildContext context}) {
    return Container(
      height: wantContentSizeButton ? height : 60.px,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 30.px),
          gradient: buttonColor!=null ? null:CommonMethods.commonLinearGradientView(context: context)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          padding: contentPadding,
          textStyle: textStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.px),
          ),
          backgroundColor: buttonColor ?? Colors.transparent,
          foregroundColor:
              splashColor ?? Theme.of(context).scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
        ),
        child: child ?? Text(text),
      ),
    );
  }

  static Widget commonTextFieldForLoginSignUP(
      {double? elevation,
      String? hintText,
      String? labelText,
      String? errorText,
      String? title,
      TextStyle? titleStyle,
      EdgeInsetsGeometry? contentPadding,
      TextEditingController? controller,
      int? maxLines,
      double? cursorHeight,
      bool wantBorder = false,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator,
      Color? fillColor,
      Color? initialBorderColor,
      double? initialBorderWidth,
      TextInputType? keyboardType,
      double? borderRadius,
      double? maxHeight,
      TextStyle? hintStyle,
      TextStyle? style,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool autofocus = false,
      bool readOnly = false,
      bool hintTextColor = false,
      Widget? suffixIcon,
      String? prefixIcon,
      AutovalidateMode? autoValidateMode,
      int? maxLength,
      GestureTapCallback? onTap,
      bool obscureText = false,
      FocusNode? focusNode,
      MaxLengthEnforcement? maxLengthEnforcement,
      bool? filled,
      required BuildContext context,
      bool isCard = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(borderRadius ?? 14.px),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Row(
          children: [
            if (prefixIcon != null)
              Padding(
                padding: EdgeInsets.only(right: 8.px),
                child: CommonMethods.appIcons(
                    context: context,
                    assetName: prefixIcon,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.px),
                child: TextFormField(
                  focusNode: focusNode,
                  maxLengthEnforcement: maxLengthEnforcement,
                  obscureText: obscureText,
                  onTap: onTap,
                  maxLength: maxLength,
                  cursorHeight: cursorHeight,
                  cursorColor: Theme.of(context).primaryColor,
                  autovalidateMode: autoValidateMode,
                  controller: controller,
                  onChanged: onChanged ??
                      (value) {
                        value = value.trim();
                        if (value.isEmpty ||
                            value.replaceAll(" ", "").isEmpty) {
                          controller?.text = "";
                        }
                      },
                  validator: validator,
                  keyboardType: keyboardType ?? TextInputType.streetAddress,
                  readOnly: readOnly,
                  autofocus: autofocus,
                  inputFormatters: inputFormatters,
                  textCapitalization: textCapitalization,
                  style: style ??
                      Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 14.px),
                  decoration: InputDecoration(
                    errorText: errorText,
                    counterText: '',
                    errorStyle: errorStyle ??
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.error),
                    hintText: hintText,
                    labelText: labelText,
                    labelStyle: labelStyle,
                    fillColor: fillColor ?? Theme.of(context).primaryColor,
                    filled: filled ?? false,
                    hintStyle: hintStyle ??
                        Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 14.px),
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            if (suffixIcon != null) suffixIcon,
          ],
        ),
      ),
    );
  }

  static imageView({
    double? width,
    double? height,
    double? radius,
    required String image,
    String? defaultNetworkImage,
    BoxFit? fit,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SizedBox(
      height: height ?? 64.px,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8.px),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return Container(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              color:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.2.px),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 8.px),
                child: Icon(Icons.error, color: Theme.of(context).primaryColor),
              ),
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return SizedBox(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              child: Shimmer.fromColors(
                baseColor: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.4.px),
                highlightColor: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.4.px),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static switchButton(
      {bool value = false,
      ValueChanged<bool>? onChanged,
      required BuildContext context}) {
    return CupertinoSwitch(
      activeColor: Theme.of(context).primaryColor,
      value: value,
      onChanged: onChanged,
    );
  }

  static Widget commonOtpView(
          {MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
          PinCodeFieldShape? shape,
          TextInputType keyboardType = TextInputType.number,
          List<TextInputFormatter>? inputFormatters,
          TextEditingController? controller,
          ValueChanged<String>? onChanged,
          ValueChanged<String>? onCompleted,
          int length = 4,
          double? height,
          double? width,
          double? borderRadius,
          double? borderWidth,
          bool readOnly = false,
          bool autoFocus = true,
          bool enableActiveFill = true,
          bool enablePinAutofill = true,
          bool autoDismissKeyboard = true,
          TextStyle? textStyle,
          Color? cursorColor,
          Color? inactiveColor,
          Color? inactiveFillColor,
          Color? activeColor,
          Color? activeFillColor,
          Color? selectedColor,
          Color? selectedFillColor,
          required BuildContext context}) =>
      PinCodeTextField(
        length: length,
        mainAxisAlignment: mainAxisAlignment,
        appContext: context,
        cursorColor: cursorColor ?? Theme.of(context).primaryColor,
        autoFocus: autoFocus,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters ??
            <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        readOnly: readOnly,
        textStyle: textStyle ??
            Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20.px),
        autoDisposeControllers: false,
        enabled: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          inactiveColor: const Color(0xffE9E9E9).withOpacity(0.8),
          inactiveFillColor: const Color(0xffE9E9E9).withOpacity(0.8),
          activeColor: const Color(0xffE9E9E9).withOpacity(0.8),
          activeFillColor: const Color(0xffE9E9E9).withOpacity(0.8),
          selectedColor: Theme.of(context).colorScheme.primary,
          selectedFillColor: const Color(0xffE9E9E9).withOpacity(0.8),
          shape: shape ?? PinCodeFieldShape.box,
          fieldWidth: width ?? 60.px,
          fieldHeight: height ?? 60.px,
          borderWidth: borderWidth ?? .5.px,
          borderRadius: BorderRadius.circular(borderRadius ?? 15.px),
        ),
        enableActiveFill: enableActiveFill,
        controller: controller,
        onChanged: onChanged,
        enablePinAutofill: enablePinAutofill,
        onCompleted: onCompleted,
        autoDismissKeyboard: autoDismissKeyboard,
      );

  static void showAlertDialog(
      {String title = StringConstants.logout,
      String content = StringConstants.wouldYouLikeToLogout,
      VoidCallback? onPressedYes,
      required BuildContext context}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(StringConstants.no),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: onPressedYes,
            child: const Text(StringConstants.yes),
          ),
        ],
      ),
    );
  }

  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
    try {
      final result = await http.get(Uri.parse('https://www.google.com/'));
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  ///For Check Get Api Response
  static Future<bool> responseCheckForGetMethod(
      {http.Response? response,
      bool wantSuccessToast = false,
      bool wantErrorToast = false,
      required BuildContext context}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (wantErrorToast) {
      if (responseMap[ApiKeyConstants.message] != null) {
        //snackBarView(title: responseMap[ApiKeyConstants.message]);
      }
      /*if (responseMap[ApiKeyConstants.error] != null) {
        snackBarView(title: responseMap[ApiKeyConstants.error]);
      }*/
    }
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null && response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

  ///For Check Post Api Response
  static Future<bool> responseCheckForPostMethod(
      {http.Response? response,
      bool wantSnackBar = false,
      required BuildContext context}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (wantSnackBar) {
      if (responseMap[ApiKeyConstants.message] != null) {
        CommonWidgets.toastView(title: responseMap[ApiKeyConstants.message] ?? '',context: context);
      }
    }
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null && response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

  static toastView(
      {required BuildContext context, required String title, int seconds = 1}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 12.px + 2.px,
              ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.px, vertical: 16.px),
        backgroundColor: Theme.of(context).primaryColor,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: seconds),
      ),
    );
  }
}
