import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/progress_bar.dart';
import 'about_us_controller.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    var aboutUsController =
        Provider.of<AboutUsController>(context, listen: false);
    aboutUsController.initMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
            context: context,
            title: StringConstants.aboutUs,
          ),
          body: ProgressBar(
            inAsyncCall: controller.inAsyncCall,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      /* CommonMethods.appIcons(context: context,
                        assetName: ImageConstants.imageAboutUs,
                        height: 350.px,
                        width: 300.px,
                      ),*/
                      Text(
                        controller.data?.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                      SizedBox(height: 20.px),
                      Html(
                        data: controller.data?.description ?? '',
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
