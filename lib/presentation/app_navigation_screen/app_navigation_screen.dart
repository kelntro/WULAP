import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          userName: "Splashscreen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.splashscreenScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Onboarding Ten".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingTenScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Onboarding Eleven".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingElevenScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Onboarding Twelve".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.onboardingTwelveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "register".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Email Verification".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.emailVerificationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "registration_successful".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registrationSuccessfulScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Log in ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.logInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "reset_passord".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.resetPassordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "reset_passord One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.resetPassordOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "reset_passord Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.resetPassordTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "successful".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successfulScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "DASHBOARD Paluwagan".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.dashboardPaluwaganScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "add category".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addCategoryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "DASHBOARDOne".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.dashboardoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "add image".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addImageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "edit name".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editNameScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "add menu".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addMenuScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "buy - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.buyContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "buyOne".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.buyoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "buyTwo".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.buytwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "buyThree".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.buythreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "add member".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addMemberScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Oder Delivery Managemaent Four".tr,
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.oderDeliveryManagemaentFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "set c".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.setCScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Share on Facebook".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.shareOnFacebookScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success Five".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successFiveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "set a  One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.setAOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "set b".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.setBScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Notifications".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Notification Details Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationDetailsTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Notification Details Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.notificationDetailsThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Notification Details".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Notification Details One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationDetailsOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Enable Automatic Reminders".tr,
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.enableAutomaticRemindersScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Enable Automatic Reminders One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.enableAutomaticRemindersOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success Four".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successFourScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Additional Options One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.additionalOptionsOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Additional Options".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.additionalOptionsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "My Posts".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myPostsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "My PostsOne".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myPostsoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "date".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.dateScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "error".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.errorScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "member info".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.memberInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "food info".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.foodInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Set A".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.setAScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Delivery Details  - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.deliveryDetailsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Track delivery".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.trackDeliveryScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Track delivery / full modal".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.trackDeliveryFullModalScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Oder Delivery Managemaent Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.oderDeliveryManagemaentThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "receiver".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.receiverScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Paid or Not".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paidOrNotScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "contactOne".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "contactTwo".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contacttwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "contactThree".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactthreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Post Tracking".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.postTrackingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Edit Event One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editEventOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Edit Event".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editEventScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName:
                              "Date of Realization and Deadline Tracking".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context,
                              AppRoutes
                                  .dateOfRealizationAndDeadlineTrackingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success Six".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successSixScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Initial Reminder".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.initialReminderScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Late Payment Reminder".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.latePaymentReminderScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "profile".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "basic_info".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.basicInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "prof_edit".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profEditScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "prof_save".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profSaveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "success Seven".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successSevenScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "Settings".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "settingsTwo".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingstwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "settingsThree".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsthreeScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String userName,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
