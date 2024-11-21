import 'package:debwouya_market/utils/common_widgets.dart';
import 'package:debwouya_market/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'my_dish_controller.dart';

class MyDishScreen extends StatefulWidget {
  const MyDishScreen({super.key});

  @override
  State<MyDishScreen> createState() => _MyDishScreenState();
}

class _MyDishScreenState extends State<MyDishScreen> {
  @override
  void initState() {
    super.initState();
    var myDishController =
        Provider.of<MyDishController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyDishController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: CommonWidgets.appBar(
              context: context, title: StringConstants.myDishes),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.px),
              child: Wrap(
                children: List.generate(
                  14,
                  (index) => Padding(
                    padding: EdgeInsets.all(8.px),
                    child: Card(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shadowColor: Theme.of(context).scaffoldBackgroundColor,
                      surfaceTintColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.7,
                        child: Padding(
                          padding: EdgeInsets.all(14.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonWidgets.imageView(
                                image:
                                'https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png',
                                width: 80.px,
                                height: 80.px,
                                borderRadius: BorderRadius.circular(40.px),
                              ),
                              SizedBox(height: 6.px),
                              Text(
                                "Cheese Pizza",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(height: 6.px),
                              Text(
                                "\$20.00",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              SizedBox(height: 6.px),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.px, vertical: 4.px),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    borderRadius:
                                    BorderRadius.circular(20.px)),
                                child: Text(
                                  'Edit',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                      fontSize: 10.px,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
