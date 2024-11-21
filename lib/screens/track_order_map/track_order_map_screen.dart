import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/common_methods.dart';
import '../../utils/common_widgets.dart';
import '../../utils/constants/icons_constant.dart';
import 'track_order_map_controller.dart';

class TrackOrderMapScreen extends StatefulWidget {
  const TrackOrderMapScreen({super.key});

  @override
  State<TrackOrderMapScreen> createState() => _TrackOrderMapScreenState();
}

class _TrackOrderMapScreenState extends State<TrackOrderMapScreen> {
  @override
  void initState() {
    super.initState();
    var trackOrderMapController =
        Provider.of<TrackOrderMapController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrackOrderMapController>(
      builder: (context, controller, child) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.asset(
                'lib/assets/images/Group 1171276026.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.px),
                child: Column(
                  children: [
                    SizedBox(height: 70.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CommonMethods.appIcons(context: context,
                            assetName: IconConstants.icBack,
                            height: 34.px,
                            width: 34.px,
                          ),
                        ),
                        Text(
                          'Track Order',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 20.px),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
