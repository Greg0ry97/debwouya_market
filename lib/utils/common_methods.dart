import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constants/image_constants.dart';

class CommonMethods {
  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Widget appIcons(
      {required String assetName,
      double? width,
      double? height,
      bool isColorGradient = true,
      required BuildContext context,
      Color? color}) {
    return GradientWidget(
      gradient: isColorGradient
          ? commonLinearGradientView(context: context)
          : commonLinearGradientViewWhite(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetName,
            height: height ?? 24.px,
            width: width ?? 24.px,
            color: color,
          ),
        ],
      ),
    );
  }


  static Widget textGradient(
      {required String text,
      double? width,
      double? height,
      bool isGradient = true,
      required BuildContext context, TextStyle? style,
      Color? color}) {
    return GradientWidget(
      gradient: isGradient
          ? commonLinearGradientView(context: context)
          : commonLinearGradientViewWhite(context: context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: style ?? Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(
                fontSize: 14.px),
          ),
        ],
      ),
    );
  }


  static Widget appIconsReal(
      {required String assetName,
      double? width,
      double? height,
      Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          height: height ?? 24.px,
          width: width ?? 24.px,
          color: color,
        ),
      ],
    );
  }

  static Future<void> commonAndroidNoInternetDialog(
      {bool isDismiss = true,
      GestureTapCallback? onTap,
      required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset(ImageConstants.imageLogoSplash),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Whoops!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "No internet connection found.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Check your connection and try again.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      useSafeArea: true,
      barrierDismissible: isDismiss,
    );
  }

  static LinearGradient commonLinearGradientView(
          {required BuildContext context}) =>
      LinearGradient(
        end: Alignment.topRight,
        begin: Alignment.bottomLeft,
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
        ],
      );

  static LinearGradient commonLinearGradientViewGrey(
          {required BuildContext context}) =>
      LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surface,
        ],
      );

  static LinearGradient commonLinearGradientViewWhite(
          {required BuildContext context}) =>
      LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [
          Theme.of(context).scaffoldBackgroundColor,
          Theme.of(context).scaffoldBackgroundColor,
        ],
      );

  static Widget dataNotFound() {
    return Center(
      child: Image.asset(ImageConstants.imageLogoSplash),
    );
  }
}

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    super.key,
    this.text,
    required this.gradient,
    this.style,
    this.child,
  });

  final String? text;
  final TextStyle? style;
  final Widget? child;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child ?? Text(text ?? '', style: style),
    );
  }
}
