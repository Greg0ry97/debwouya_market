import 'package:debwouya_market/screens/track_order_map/track_order_map_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation_methos.dart';

class TrackOrderController extends ChangeNotifier {
  clickOnNextButton({required BuildContext context}) {
    }

  clickOnUploadButton({required BuildContext context}) {}

  clickOnTrack({required BuildContext context}) {
    NavigationMethods.pushMethod(
        context: context, widget: const TrackOrderMapScreen());

  }
}
