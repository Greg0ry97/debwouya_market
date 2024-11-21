import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/common_methods.dart';
import '../../../utils/common_widgets.dart';
import '../../../utils/constants/icons_constant.dart';
import '../../../utils/constants/string_constants.dart';
import 'favorites_controller.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    var favoritesController =
        Provider.of<FavoritesController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              title: StringConstants.favorites,
              context: context,
              wantBackButton: false),
          body:  ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonWidgets.imageView(
                      image:
                      'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                      height: 90.px,
                      width: 90.px,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(20.px),
                    ),
                    SizedBox(width: 10.px),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nike Shoes',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                        SizedBox(height: 4.px),
                        Text(
                          'Colour: Green',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 12.px),
                        ),
                        SizedBox(height: 4.px),
                        Text(
                          'Rs. 49.00',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      ],
                    ),
                    Spacer(),
                    CommonMethods.appIcons(
                      context: context,
                      assetName: IconConstants.icHeartActive,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
