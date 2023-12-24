import 'package:flutter/material.dart';
import 'package:wulap_application/presentation/note_screen/note_screen.dart';
import 'package:wulap_application/presentation/splashscreen_screen/splashscreen_screen.dart';
import 'package:wulap_application/presentation/onboarding_ten_screen/onboarding_ten_screen.dart';
import 'package:wulap_application/presentation/onboarding_eleven_screen/onboarding_eleven_screen.dart';
import 'package:wulap_application/presentation/onboarding_twelve_screen/onboarding_twelve_screen.dart';
import 'package:wulap_application/presentation/register_screen/register_screen.dart';
import 'package:wulap_application/presentation/registration_successful_screen/registration_successful_screen.dart';
import 'package:wulap_application/presentation/log_in_screen/log_in_screen.dart';
import 'package:wulap_application/presentation/reset_passord_screen/reset_passord_screen.dart';
import 'package:wulap_application/presentation/reset_passord_one_screen/reset_passord_one_screen.dart';
import 'package:wulap_application/presentation/reset_passord_two_screen/reset_passord_two_screen.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/dashboard_paluwagan_screen.dart';
import 'package:wulap_application/presentation/add_category_screen/add_category_screen.dart';
import 'package:wulap_application/presentation/dashboardone_screen/dashboardone_screen.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/presentation/buy_container_screen/buy_container_screen.dart';
import 'package:wulap_application/presentation/notifications_screen/notifications_screen.dart';
import 'package:wulap_application/presentation/success_screen/success_screen.dart';
import 'package:wulap_application/presentation/settings_screen/settings_screen.dart';
import 'package:wulap_application/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashscreenScreen = '/splashscreen_screen';

  static const String onboardingTenScreen = '/onboarding_ten_screen';

  static const String onboardingElevenScreen = '/onboarding_eleven_screen';

  static const String facebookLoginScreen = '/facebook_login_screen';

  static const String onboardingTwelveScreen = '/onboarding_twelve_screen';

  static const String registerScreen = '/register_screen';

  static const String emailVerificationScreen = '/email_verification_screen';

  static const String registrationSuccessfulScreen =
      '/registration_successful_screen';

  static const String logInScreen = '/log_in_screen';

  static const String resetPassordScreen = '/reset_passord_screen';

  static const String resetPassordOneScreen = '/reset_passord_one_screen';

  static const String resetPassordTwoScreen = '/reset_passord_two_screen';

  static const String successfulScreen = '/successful_screen';

  static const String dashboardPaluwaganScreen = '/dashboard_paluwagan_screen';

  static const String addCategoryScreen = '/add_category_screen';

  static const String dashboardoneScreen = '/dashboardone_screen';

  static const String addImageScreen = '/add_image_screen';

  static const String editNameScreen = '/edit_name_screen';

  static const String addMenuScreen = '/add_menu_screen';

  static const String successTwoScreen = '/success_two_screen';

  static const buyPage = '/buy_page';

  static const String buyContainerScreen = '/buy_container_screen';

  static const String buyoneScreen = '/buyone_screen';

  static const String buytwoScreen = '/buytwo_screen';

  static const String buythreeScreen = '/buythree_screen';

  static const String successOneScreen = '/success_one_screen';

  static const String addMemberScreen = '/add_member_screen';

  static const String successThreeScreen = '/success_three_screen';

  static const String oderDeliveryManagemaentFourScreen =
      '/oder_delivery_managemaent_four_screen';

  static const String setCScreen = '/set_c_screen';

  static const String shareOnFacebookScreen = '/share_on_facebook_screen';

  static const String successFiveScreen = '/success_five_screen';

  static const String setAOneScreen = '/set_a_one_screen';

  static const String setBScreen = '/set_b_screen';

  static const String notificationsScreen = '/notifications_screen';

  static const String notificationDetailsTwoScreen =
      '/notification_details_two_screen';

  static const String notificationDetailsThreeScreen =
      '/notification_details_three_screen';

  static const String notificationDetailsScreen =
      '/notification_details_screen';

  static const String notificationDetailsOneScreen =
      '/notification_details_one_screen';

  static const String enableAutomaticRemindersScreen =
      '/enable_automatic_reminders_screen';

  static const String enableAutomaticRemindersOneScreen =
      '/enable_automatic_reminders_one_screen';

  static const String successFourScreen = '/success_four_screen';

  static const String additionalOptionsOneScreen =
      '/additional_options_one_screen';

  static const String additionalOptionsScreen = '/additional_options_screen';

  static const String myPostsScreen = '/my_posts_screen';

  static String DefaultWidget() => '/';

  static const String myPostsoneScreen = '/my_postsone_screen';

  static const String dateScreen = '/date_screen';

  static const String successScreen = '/success_screen';

  static const String errorScreen = '/error_screen';

  static const String memberInfoScreen = '/member_info_screen';

  static const String foodInfoScreen = '/food_info_screen';

  static const String setAScreen = '/set_a_screen';

  static const String deliveryDetailsPage = '/delivery_details_page';

  static const String deliveryDetailsTabContainerScreen =
      '/delivery_details_tab_container_screen';

  static const String trackDeliveryScreen = '/track_delivery_screen';

  static const String trackDeliveryFullModalScreen =
      '/track_delivery_full_modal_screen';

  static const String oderDeliveryManagemaentThreeScreen =
      '/oder_delivery_managemaent_three_screen';

  static const String receiverScreen = '/receiver_screen';

  static const String paidOrNotScreen = '/paid_or_not_screen';

  static const String contactoneScreen = '/contactone_screen';

  static const String contacttwoScreen = '/contacttwo_screen';

  static const String contactthreeScreen = '/contactthree_screen';

  static const String postTrackingScreen = '/post_tracking_screen';

  static const String editEventOneScreen = '/edit_event_one_screen';

  static const String editEventScreen = '/edit_event_screen';

  static const String dateOfRealizationAndDeadlineTrackingScreen =
      '/date_of_realization_and_deadline_tracking_screen';

  static const String successSixScreen = '/success_six_screen';

  static const String initialReminderScreen = '/initial_reminder_screen';

  static const String latePaymentReminderScreen =
      '/late_payment_reminder_screen';

  static const String profileScreen = '/profile_screen';

  static const String basicInfoScreen = '/basic_info_screen';

  static const String profEditScreen = '/prof_edit_screen';

  static const String profSaveScreen = '/prof_save_screen';

  static const String successSevenScreen = '/success_seven_screen';

  static const String settingsScreen = '/settings_screen';

  static const String settingstwoScreen = '/settingstwo_screen';

  static const String settingsthreeScreen = '/settingsthree_screen';

  static const String noteScreen = '/note_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    buyPage: (context) => BuyPage(),
    noteScreen: (context) => NoteScreen(),
    splashscreenScreen: (context) => SplashscreenScreen(),
    onboardingTenScreen: (context) => OnboardingTenScreen(),
    onboardingElevenScreen: (context) => OnboardingElevenScreen(),
    onboardingTwelveScreen: (context) => OnboardingTwelveScreen(),
    registerScreen: (context) => RegisterScreen(),
    registrationSuccessfulScreen: (context) => RegistrationSuccessfulScreen(),
    logInScreen: (context) => LogInScreen(),
    resetPassordScreen: (context) => ResetPassordScreen(),
    resetPassordOneScreen: (context) => ResetPassordOneScreen(),
    resetPassordTwoScreen: (context) => ResetPassordTwoScreen(),
    dashboardPaluwaganScreen: (context) => DashboardPaluwaganScreen(),
    addCategoryScreen: (context) => AddCategoryScreen(),
    dashboardoneScreen: (context) => DashboardoneScreen(),
    buyContainerScreen: (context) => BuyContainerScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    successScreen: (context) => SuccessScreen(),
    settingsScreen: (context) => SettingsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
  };
}
