import 'package:flutter/material.dart';
import 'package:wulap_application/presentation/note_screen/note_screen.dart';
import 'package:wulap_application/presentation/splashscreen_screen/splashscreen_screen.dart';
import 'package:wulap_application/presentation/onboarding_ten_screen/onboarding_ten_screen.dart';
import 'package:wulap_application/presentation/onboarding_eleven_screen/onboarding_eleven_screen.dart';
import 'package:wulap_application/presentation/onboarding_twelve_screen/onboarding_twelve_screen.dart';
import 'package:wulap_application/presentation/register_screen/register_screen.dart';
import 'package:wulap_application/presentation/email_verification_screen/email_verification_screen.dart';
import 'package:wulap_application/presentation/registration_successful_screen/registration_successful_screen.dart';
import 'package:wulap_application/presentation/log_in_screen/log_in_screen.dart';
import 'package:wulap_application/presentation/reset_passord_screen/reset_passord_screen.dart';
import 'package:wulap_application/presentation/reset_passord_one_screen/reset_passord_one_screen.dart';
import 'package:wulap_application/presentation/reset_passord_two_screen/reset_passord_two_screen.dart';
import 'package:wulap_application/presentation/successful_screen/successful_screen.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/dashboard_paluwagan_screen.dart';
import 'package:wulap_application/presentation/add_category_screen/add_category_screen.dart';
import 'package:wulap_application/presentation/dashboardone_screen/dashboardone_screen.dart';
import 'package:wulap_application/presentation/edit_name_screen/edit_name_screen.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/presentation/success_two_screen/success_two_screen.dart';
import 'package:wulap_application/presentation/buy_container_screen/buy_container_screen.dart';
import 'package:wulap_application/presentation/buyone_screen/buyone_screen.dart';
import 'package:wulap_application/presentation/buytwo_screen/buytwo_screen.dart';
import 'package:wulap_application/presentation/buythree_screen/buythree_screen.dart';
import 'package:wulap_application/presentation/success_one_screen/success_one_screen.dart';
import 'package:wulap_application/presentation/success_three_screen/success_three_screen.dart';
import 'package:wulap_application/presentation/oder_delivery_managemaent_four_screen/oder_delivery_managemaent_four_screen.dart';
import 'package:wulap_application/presentation/set_c_screen/set_c_screen.dart';
import 'package:wulap_application/presentation/share_on_facebook_screen/share_on_facebook_screen.dart';
import 'package:wulap_application/presentation/success_five_screen/success_five_screen.dart';
import 'package:wulap_application/presentation/set_a_one_screen/set_a_one_screen.dart';
import 'package:wulap_application/presentation/set_b_screen/set_b_screen.dart';
import 'package:wulap_application/presentation/notifications_screen/notifications_screen.dart';
import 'package:wulap_application/presentation/notification_details_two_screen/notification_details_two_screen.dart';
import 'package:wulap_application/presentation/notification_details_three_screen/notification_details_three_screen.dart';
import 'package:wulap_application/presentation/notification_details_screen/notification_details_screen.dart';
import 'package:wulap_application/presentation/notification_details_one_screen/notification_details_one_screen.dart';
import 'package:wulap_application/presentation/enable_automatic_reminders_screen/enable_automatic_reminders_screen.dart';
import 'package:wulap_application/presentation/enable_automatic_reminders_one_screen/enable_automatic_reminders_one_screen.dart';
import 'package:wulap_application/presentation/success_four_screen/success_four_screen.dart';
import 'package:wulap_application/presentation/my_posts_screen/my_posts_screen.dart';
import 'package:wulap_application/presentation/my_postsone_screen/my_postsone_screen.dart';
import 'package:wulap_application/presentation/date_screen/date_screen.dart';
import 'package:wulap_application/presentation/success_screen/success_screen.dart';
import 'package:wulap_application/presentation/error_screen/error_screen.dart';
import 'package:wulap_application/presentation/member_info_screen/member_info_screen.dart';
import 'package:wulap_application/presentation/food_info_screen/food_info_screen.dart';
import 'package:wulap_application/presentation/set_a_screen/set_a_screen.dart';
import 'package:wulap_application/presentation/delivery_details_tab_container_screen/delivery_details_tab_container_screen.dart';
import 'package:wulap_application/presentation/track_delivery_screen/track_delivery_screen.dart';
import 'package:wulap_application/presentation/track_delivery_full_modal_screen/track_delivery_full_modal_screen.dart';
import 'package:wulap_application/presentation/oder_delivery_managemaent_three_screen/oder_delivery_managemaent_three_screen.dart';
import 'package:wulap_application/presentation/receiver_screen/receiver_screen.dart';
import 'package:wulap_application/presentation/paid_or_not_screen/paid_or_not_screen.dart';
import 'package:wulap_application/presentation/contactone_screen/contactone_screen.dart';
import 'package:wulap_application/presentation/contacttwo_screen/contacttwo_screen.dart';
import 'package:wulap_application/presentation/contactthree_screen/contactthree_screen.dart';
import 'package:wulap_application/presentation/post_tracking_screen/post_tracking_screen.dart';
import 'package:wulap_application/presentation/edit_event_one_screen/edit_event_one_screen.dart';
import 'package:wulap_application/presentation/edit_event_screen/edit_event_screen.dart';
import 'package:wulap_application/presentation/date_of_realization_and_deadline_tracking_screen/date_of_realization_and_deadline_tracking_screen.dart';
import 'package:wulap_application/presentation/success_six_screen/success_six_screen.dart';
import 'package:wulap_application/presentation/initial_reminder_screen/initial_reminder_screen.dart';
import 'package:wulap_application/presentation/late_payment_reminder_screen/late_payment_reminder_screen.dart';
import 'package:wulap_application/presentation/profile_screen/profile_screen.dart';
import 'package:wulap_application/presentation/basic_info_screen/basic_info_screen.dart';
import 'package:wulap_application/presentation/prof_edit_screen/prof_edit_screen.dart';
import 'package:wulap_application/presentation/prof_save_screen/prof_save_screen.dart';
import 'package:wulap_application/presentation/success_seven_screen/success_seven_screen.dart';
import 'package:wulap_application/presentation/settings_screen/settings_screen.dart';
import 'package:wulap_application/presentation/settingstwo_screen/settingstwo_screen.dart';
import 'package:wulap_application/presentation/settingsthree_screen/settingsthree_screen.dart';
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
    emailVerificationScreen: (context) => EmailVerificationScreen(),
    registrationSuccessfulScreen: (context) => RegistrationSuccessfulScreen(),
    logInScreen: (context) => LogInScreen(),
    resetPassordScreen: (context) => ResetPassordScreen(),
    resetPassordOneScreen: (context) => ResetPassordOneScreen(),
    resetPassordTwoScreen: (context) => ResetPassordTwoScreen(),
    successfulScreen: (context) => SuccessfulScreen(),
    dashboardPaluwaganScreen: (context) => DashboardPaluwaganScreen(),
    addCategoryScreen: (context) => AddCategoryScreen(),
    dashboardoneScreen: (context) => DashboardoneScreen(),
    editNameScreen: (context) => EditNameScreen(),
    successTwoScreen: (context) => SuccessTwoScreen(),
    buyContainerScreen: (context) => BuyContainerScreen(),
    buyoneScreen: (context) => BuyoneScreen(),
    buytwoScreen: (context) => BuytwoScreen(),
    buythreeScreen: (context) => BuythreeScreen(),
    successOneScreen: (context) => SuccessOneScreen(),
    successThreeScreen: (context) => SuccessThreeScreen(),
    oderDeliveryManagemaentFourScreen: (context) =>
        OderDeliveryManagemaentFourScreen(),
    setCScreen: (context) => SetCScreen(),
    shareOnFacebookScreen: (context) => ShareOnFacebookScreen(),
    successFiveScreen: (context) => SuccessFiveScreen(),
    setAOneScreen: (context) => SetAOneScreen(),
    setBScreen: (context) => SetBScreen(),
    notificationsScreen: (context) => NotificationsScreen(),
    notificationDetailsTwoScreen: (context) => NotificationDetailsTwoScreen(),
    notificationDetailsThreeScreen: (context) =>
        NotificationDetailsThreeScreen(),
    notificationDetailsScreen: (context) => NotificationDetailsScreen(),
    notificationDetailsOneScreen: (context) => NotificationDetailsOneScreen(),
    enableAutomaticRemindersScreen: (context) =>
        EnableAutomaticRemindersScreen(),
    enableAutomaticRemindersOneScreen: (context) =>
        EnableAutomaticRemindersOneScreen(),
    successFourScreen: (context) => SuccessFourScreen(),
    myPostsScreen: (context) => MyPostsScreen(),
    myPostsoneScreen: (context) => MyPostsoneScreen(),
    dateScreen: (context) => DateScreen(),
    successScreen: (context) => SuccessScreen(),
    errorScreen: (context) => ErrorScreen(),
    memberInfoScreen: (context) => MemberInfoScreen(),
    foodInfoScreen: (context) => FoodInfoScreen(),
    setAScreen: (context) => SetAScreen(),
    deliveryDetailsTabContainerScreen: (context) =>
        DeliveryDetailsTabContainerScreen(),
    trackDeliveryScreen: (context) => TrackDeliveryScreen(),
    trackDeliveryFullModalScreen: (context) => TrackDeliveryFullModalScreen(),
    oderDeliveryManagemaentThreeScreen: (context) =>
        OderDeliveryManagemaentThreeScreen(),
    receiverScreen: (context) => ReceiverScreen(),
    paidOrNotScreen: (context) => PaidOrNotScreen(),
    contactoneScreen: (context) => ContactoneScreen(),
    contacttwoScreen: (context) => ContacttwoScreen(),
    contactthreeScreen: (context) => ContactthreeScreen(),
    postTrackingScreen: (context) => PostTrackingScreen(),
    editEventOneScreen: (context) => EditEventOneScreen(),
    editEventScreen: (context) => EditEventScreen(),
    dateOfRealizationAndDeadlineTrackingScreen: (context) =>
        DateOfRealizationAndDeadlineTrackingScreen(),
    successSixScreen: (context) => SuccessSixScreen(),
    initialReminderScreen: (context) => InitialReminderScreen(),
    latePaymentReminderScreen: (context) => LatePaymentReminderScreen(),
    profileScreen: (context) => ProfileScreen(),
    basicInfoScreen: (context) => BasicInfoScreen(),
    profEditScreen: (context) => ProfEditScreen(),
    profSaveScreen: (context) => ProfSaveScreen(),
    successSevenScreen: (context) => SuccessSevenScreen(),
    settingsScreen: (context) => SettingsScreen(),
    settingstwoScreen: (context) => SettingstwoScreen(),
    settingsthreeScreen: (context) => SettingsthreeScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
  };
}
