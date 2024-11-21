import 'package:debwouya_market/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var splashController =
        Provider.of<SplashController>(context, listen: false);
    splashController.manage(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  ImageConstants.imageLogoSplash,
                  height: 200.px,
                  width: 200.px,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
