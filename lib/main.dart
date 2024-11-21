import 'package:debwouya_market/screens/about_us/about_us_controller.dart';
import 'package:debwouya_market/screens/add_products/add_products_controller.dart';
import 'package:debwouya_market/screens/add_your_business_details/add_your_business_details_controller.dart';
import 'package:debwouya_market/screens/add_your_business_type/add_your_business_type_controller.dart';
import 'package:debwouya_market/screens/bottom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:debwouya_market/screens/business_verification/business_verification_controller.dart';
import 'package:debwouya_market/screens/change_password/change_password_controller.dart';
import 'package:debwouya_market/screens/chat/chat_controller.dart';
import 'package:debwouya_market/screens/chat_list/chat_list_controller.dart';
import 'package:debwouya_market/screens/create_new_password/create_new_password_controller.dart';
import 'package:debwouya_market/screens/details/details_controller.dart';
import 'package:debwouya_market/screens/edit_profile/edit_profile_controller.dart';
import 'package:debwouya_market/screens/get_starts/get_starts_controller.dart';
import 'package:debwouya_market/screens/home/home_controller.dart';
import 'package:debwouya_market/screens/invoices/invoices_controller.dart';
import 'package:debwouya_market/screens/login/login_controller.dart';
import 'package:debwouya_market/screens/my_dish/my_dish_controller.dart';
import 'package:debwouya_market/screens/my_products/my_products_controller.dart';
import 'package:debwouya_market/screens/order/order_controller.dart';
import 'package:debwouya_market/screens/order_history/order_history_controller.dart';
import 'package:debwouya_market/screens/otp/otp_controller.dart';
import 'package:debwouya_market/screens/password_reset/password_reset_controller.dart';
import 'package:debwouya_market/screens/privacy_policy/privacy_policy_controller.dart';
import 'package:debwouya_market/screens/profile/profile_controller.dart';
import 'package:debwouya_market/screens/setting/setting_controller.dart';
import 'package:debwouya_market/screens/sign_up/sign_up_controller.dart';
import 'package:debwouya_market/screens/splash/splash_controller.dart';
import 'package:debwouya_market/screens/splash/splash_screen.dart';
import 'package:debwouya_market/screens/support/support_controller.dart';
import 'package:debwouya_market/screens/terms_and_condition/terms_and_condition_controller.dart';
import 'package:debwouya_market/screens/track_order/track_order_controller.dart';
import 'package:debwouya_market/screens/track_order_map/track_order_map_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/address/address_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/faq/faq_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/favorites/favorites_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/market/market_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/market_sub_categories/market_sub_categories_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/payment/payment_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/payment_methods/payment_methods_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/product_detail/product_detail_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/search/search_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/setting/setting_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/shipping_address/shipping_address_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/user_bottom_nav_bar/user_bottom_nav_bar_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/user_home/user_home_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/user_notification/user_notification_controller.dart';
import 'package:debwouya_market/screens/user_side_screens/user_profile/user_profile_controller.dart';
import 'package:debwouya_market/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

int selectedIndex = 0;
int selectedIndexUser = 0;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SignUpController()),
        ChangeNotifierProvider(create: (_) => PasswordResetController()),
        ChangeNotifierProvider(create: (_) => OtpController()),
        ChangeNotifierProvider(create: (_) => CreateNewPasswordController()),
        ChangeNotifierProvider(create: (_) => BusinessVerificationController()),
        ChangeNotifierProvider(
            create: (_) => AddYourBusinessDetailsController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => EditProfileController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => OrderHistoryController()),
        ChangeNotifierProvider(create: (_) => MyDishController()),
        ChangeNotifierProvider(create: (_) => ChangePasswordController()),
        ChangeNotifierProvider(create: (_) => PrivacyPolicyController()),
        ChangeNotifierProvider(create: (_) => TermsAndConditionController()),
        ChangeNotifierProvider(create: (_) => SettingController()),
        ChangeNotifierProvider(create: (_) => TrackOrderController()),
        ChangeNotifierProvider(create: (_) => TrackOrderMapController()),
        ChangeNotifierProvider(create: (_) => GetStartsController()),
        ChangeNotifierProvider(create: (_) => AddYourBusinessTypeController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => ChatListController()),
        ChangeNotifierProvider(create: (_) => InvoicesController()),
        ChangeNotifierProvider(create: (_) => MyProductsController()),
        ChangeNotifierProvider(create: (_) => AddProductsController()),
        ChangeNotifierProvider(create: (_) => OrderController()),
        ChangeNotifierProvider(create: (_) => DetailController()),
        ChangeNotifierProvider(create: (_) => AboutUsController()),
        ChangeNotifierProvider(create: (_) => SupportController()),
        ChangeNotifierProvider(create: (_) => UserBottomNavBarController()),
        ChangeNotifierProvider(create: (_) => FavoritesController()),
        ChangeNotifierProvider(create: (_) => UserProfileController()),
        ChangeNotifierProvider(create: (_) => UserHomeController()),
        ChangeNotifierProvider(create: (_) => MarketController()),
        ChangeNotifierProvider(create: (_) => MarketSubCategoriesController()),
        ChangeNotifierProvider(create: (_) => ProductDetailController()),
        ChangeNotifierProvider(create: (_) => SearchScreenController()),
        ChangeNotifierProvider(create: (_) => PaymentController()),
        ChangeNotifierProvider(create: (_) => AddressController()),
        ChangeNotifierProvider(create: (_) => PaymentMethodsController()),
        ChangeNotifierProvider(create: (_) => UserSettingController()),
        ChangeNotifierProvider(create: (_) => ShippingAddressController()),
        ChangeNotifierProvider(create: (_) => UserNotificationController()),
        ChangeNotifierProvider(create: (_) => FaqController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: AppThemeData.themeData(fontFamily: 'Montserrat'),
        );
      },
    );
  }
}
