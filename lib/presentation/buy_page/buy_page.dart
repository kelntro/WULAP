import 'package:wulap_application/presentation/buy_page/AsianCuisineScreen.dart';
import 'package:wulap_application/presentation/buy_page/BeveragesScreen.dart';
import 'package:wulap_application/presentation/buy_page/FastFoodScreen.dart';
import 'package:wulap_application/presentation/buy_page/HealthyOptionsScreen.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_screen_list.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import '../buy_page/widgets/categoriesfoodgrid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class BuyPage extends StatelessWidget {
  BuyPage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 9.v),
          child: Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 32.h, right: 44.h),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "lbl_search".tr,
                  ),
                ),
                SizedBox(height: 16.v),
                Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child: Text(
                    "lbl_top_categories".tr,
                    style: CustomTextStyles.bodyLargeABeeZeeBlack90002,
                  ),
                ),
                SizedBox(height: 15.v),
                _buildCategoriesFoodGrid(context),
                SizedBox(height: 31.v),
                _buildDivider(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 80,
        leadingWidth: 80,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgProfile34x34,
            margin: EdgeInsets.only(
              left: 20.h,
              top: 11.v,
              bottom: 11.v,
            )),
        title: AppbarSubtitle(
            text: "Food from partners".tr, margin: EdgeInsets.only(left: 14.h)),
        actions: [
          Padding(
              padding: EdgeInsets.fromLTRB(25.h, 20.v, 25.h, 11.v),
              child: Column(children: [
                SizedBox(
                    height: 19.adaptSize,
                    width: 19.adaptSize,
                    child: Stack(alignment: Alignment.topRight, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimary,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          alignment: Alignment.center,
                          onTap: () {
                            onTapImgVector(context);
                          }),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              height: 6.adaptSize,
                              width: 6.adaptSize,
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 1.v, bottom: 11.v),
                              decoration: BoxDecoration(
                                  color: appTheme.redA700,
                                  borderRadius: BorderRadius.circular(3.h))))
                    ])),
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildCategoriesFoodGrid(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 17.h, right: 27.h),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 161.v,
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 15.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return CategoriesfoodgridItemWidget(
              imagePath: _getCategoryImage(index),
              categoryText: _getCategoryText(index),
              onTap: () {
                _navigateToCategoryScreen(context, index);
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToCategoryScreen(BuildContext context, int index) {
    print("Navigating to category screen with index $index");
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print("Navigating to FastFoodScreen");
              return FastFoodScreen();
            },
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print("Navigating to HealthyOptionsScreen");
              return HealthyOptionsScreen();
            },
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print("Navigating to BeveragesScreen");
              return BeveragesScreen();
            },
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print("Navigating to AsianCuisineScreen");
              return AsianCuisineScreen();
            },
          ),
        );
        break;
      default:
        // Handle the case where the category doesn't match any known category
        print("Invalid category index");
        break;
    }
  }

  String _getCategoryImage(int index) {
    switch (index) {
      case 0:
        return ImageConstant.imgBg;
      case 1:
        return ImageConstant.imgBg1;
      case 2:
        return ImageConstant.imgBg2;
      case 3:
        return ImageConstant.imgBg3;
      default:
        return ImageConstant.imageNotFound;
    }
  }

  String _getCategoryText(int index) {
    switch (index) {
      case 0:
        return "Fast Food";
      case 1:
        return "Healthy Options";
      case 2:
        return "Beverages";
      case 3:
        return "Asian Cuisine";
      default:
        return "Category ${index + 1}";
    }
  }

  /// Section Widget
  Widget _buildDivider(BuildContext context) {
    return SizedBox(
        height: 362.v,
        width: 379.h,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(top: 130.v),
                  child: SizedBox(
                      width: 133.h,
                      child:
                          Divider(color: appTheme.gray70019, endIndent: 7.h)))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 60.v),
                  child: SizedBox(
                      width: 143.h,
                      child:
                          Divider(color: appTheme.gray70019, indent: 17.h)))),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 60.v),
                  child: SizedBox(
                      width: 242.h,
                      child: Divider(
                          color: appTheme.gray70019, endIndent: 116.h)))),
          Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: IntrinsicWidth(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                            height: 359.v,
                            width: 379.h,
                            margin: EdgeInsets.only(top: 3.v),
                            child:
                                Stack(alignment: Alignment.topLeft, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgRectangle254,
                                  height: 359.v,
                                  width: 377.h,
                                  alignment: Alignment.center),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder12),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildBg(context,
                                                userImage:
                                                    ImageConstant.imgBg5),
                                            SizedBox(height: 16.v),
                                            Text("lbl_nethai_kitchen".tr,
                                                style:
                                                    theme.textTheme.titleLarge),
                                            SizedBox(height: 4.v),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 9.h, right: 49.h),
                                                child: Row(children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgFlagBlack90002,
                                                      height: 14.v,
                                                      width: 12.h,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5.v)),
                                                  Opacity(
                                                      opacity: 0.5,
                                                      child: Container(
                                                          height: 4.adaptSize,
                                                          width: 4.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 8.h,
                                                                  top: 12.v,
                                                                  bottom: 8.v),
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray40002
                                                                  .withOpacity(
                                                                      0.53),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.h)))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text(
                                                          "lbl_chinese".tr,
                                                          style: CustomTextStyles
                                                              .bodyLargeABeeZeeBluegray40002)),
                                                  Opacity(
                                                      opacity: 0.5,
                                                      child: Container(
                                                          height: 4.adaptSize,
                                                          width: 4.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 12.h,
                                                                  top: 12.v,
                                                                  bottom: 8.v),
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray40002
                                                                  .withOpacity(
                                                                      0.53),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.h)))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text(
                                                          "lbl_american".tr,
                                                          style: CustomTextStyles
                                                              .bodyLargeABeeZeeBluegray40002)),
                                                  Opacity(
                                                      opacity: 0.5,
                                                      child: Container(
                                                          height: 4.adaptSize,
                                                          width: 4.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 8.h,
                                                                  top: 12.v,
                                                                  bottom: 8.v),
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray40002
                                                                  .withOpacity(
                                                                      0.53),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.h)))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text(
                                                          "lbl_deshi_food".tr,
                                                          style: CustomTextStyles
                                                              .bodyLargeABeeZeeBluegray40002))
                                                ])),
                                            SizedBox(height: 9.v),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4.h, right: 57.h),
                                                child: Row(children: [
                                                  Opacity(
                                                      opacity: 0.74,
                                                      child: Text("lbl_4_3".tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyles
                                                              .bodySmallABeeZeeBlack900)),
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgIcon24Rating,
                                                      height: 20.adaptSize,
                                                      width: 20.adaptSize,
                                                      margin: EdgeInsets.only(
                                                          left: 6.h)),
                                                  Opacity(
                                                      opacity: 0.74,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 4.h),
                                                          child: Text(
                                                              "lbl_200_ratings"
                                                                  .tr,
                                                              style: CustomTextStyles
                                                                  .bodySmallABeeZeeBlack900))),
                                                  Opacity(
                                                      opacity: 0.64,
                                                      child: CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgIcon24Clock,
                                                          height: 20.adaptSize,
                                                          width: 20.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 17.h))),
                                                  Opacity(
                                                      opacity: 0.74,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 6.h),
                                                          child: Text(
                                                              "lbl_25_min".tr,
                                                              style: CustomTextStyles
                                                                  .bodySmallABeeZeeBlack900))),
                                                  Opacity(
                                                      opacity: 0.5,
                                                      child: Container(
                                                          height: 4.adaptSize,
                                                          width: 4.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 11.h,
                                                                  top: 8.v,
                                                                  bottom: 8.v),
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray40002
                                                                  .withOpacity(
                                                                      0.53),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.h)))),
                                                  Opacity(
                                                      opacity: 0.6,
                                                      child: CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgGroup,
                                                          height: 16.v,
                                                          width: 17.h,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 12.h,
                                                                  bottom:
                                                                      4.v))),
                                                  Opacity(
                                                      opacity: 0.74,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 7.h),
                                                          child: Text(
                                                              "lbl_free".tr,
                                                              style: CustomTextStyles
                                                                  .bodySmallABeeZeeBlack900)))
                                                ]))
                                          ])))
                            ])),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 3.v, bottom: 20.v),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder12),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildBg(context,
                                          userImage: ImageConstant.imgBg6),
                                      SizedBox(height: 16.v),
                                      Text("msg_mayfield_bakery".tr,
                                          style: theme.textTheme.titleLarge),
                                      SizedBox(height: 4.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 9.h, right: 49.h),
                                          child: Row(children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgFlagBlack90002,
                                                height: 14.v,
                                                width: 12.h,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5.v)),
                                            Opacity(
                                                opacity: 0.5,
                                                child: Container(
                                                    height: 4.adaptSize,
                                                    width: 4.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 8.h,
                                                        top: 12.v,
                                                        bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme
                                                            .blueGray40002
                                                            .withOpacity(0.53),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    2.h)))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text("lbl_chinese".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeABeeZeeBluegray40002)),
                                            Opacity(
                                                opacity: 0.5,
                                                child: Container(
                                                    height: 4.adaptSize,
                                                    width: 4.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 12.h,
                                                        top: 12.v,
                                                        bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme
                                                            .blueGray40002
                                                            .withOpacity(0.53),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    2.h)))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text("lbl_american".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeABeeZeeBluegray40002)),
                                            Opacity(
                                                opacity: 0.5,
                                                child: Container(
                                                    height: 4.adaptSize,
                                                    width: 4.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 8.h,
                                                        top: 12.v,
                                                        bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme
                                                            .blueGray40002
                                                            .withOpacity(0.53),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    2.h)))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text("lbl_deshi_food".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeABeeZeeBluegray40002))
                                          ])),
                                      SizedBox(height: 9.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.h, right: 57.h),
                                          child: Row(children: [
                                            Opacity(
                                                opacity: 0.74,
                                                child: Text("lbl_4_3".tr,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyles
                                                        .bodySmallABeeZeeBlack900)),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgIcon24RatingOrange400,
                                                height: 20.adaptSize,
                                                width: 20.adaptSize,
                                                margin:
                                                    EdgeInsets.only(left: 6.h)),
                                            Opacity(
                                                opacity: 0.74,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.h),
                                                    child: Text(
                                                        "lbl_200_ratings".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallABeeZeeBlack900))),
                                            Opacity(
                                                opacity: 0.64,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgIcon24Clock,
                                                    height: 20.adaptSize,
                                                    width: 20.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 17.h))),
                                            Opacity(
                                                opacity: 0.74,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 6.h),
                                                    child: Text("lbl_25_min".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallABeeZeeBlack900))),
                                            Opacity(
                                                opacity: 0.5,
                                                child: Container(
                                                    height: 4.adaptSize,
                                                    width: 4.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 11.h,
                                                        top: 8.v,
                                                        bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme
                                                            .blueGray40002
                                                            .withOpacity(0.53),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    2.h)))),
                                            Opacity(
                                                opacity: 0.6,
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgGroup,
                                                    height: 16.v,
                                                    width: 17.h,
                                                    margin: EdgeInsets.only(
                                                        left: 12.h,
                                                        bottom: 4.v))),
                                            Opacity(
                                                opacity: 0.74,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 7.h),
                                                    child: Text("lbl_free".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallABeeZeeBlack900)))
                                          ]))
                                    ]))),
                        Expanded(
                            child: Container(
                                //margin: EdgeInsets.only(top: 3.v, bottom: 20.v),
                                margin:
                                    EdgeInsets.only(left: 20.h, bottom: 22.v),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder12),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildBg(context,
                                          userImage: ImageConstant.imgBg7),
                                      SizedBox(height: 16.v),
                                      Text("lbl_cafe_brichor_s".tr,
                                          style: theme.textTheme.titleLarge),
                                      SizedBox(height: 4.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 7.h, right: 49.h),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgFlagBlack90002,
                                                    height: 14.v,
                                                    width: 12.h,
                                                    margin: EdgeInsets.only(
                                                        top: 6.v, bottom: 4.v)),
                                                Opacity(
                                                    opacity: 0.5,
                                                    child: Container(
                                                        height: 4.adaptSize,
                                                        width: 4.adaptSize,
                                                        margin: EdgeInsets.only(
                                                            left: 10.h,
                                                            top: 12.v,
                                                            bottom: 8.v),
                                                        decoration: BoxDecoration(
                                                            color: appTheme
                                                                .blueGray40002
                                                                .withOpacity(
                                                                    0.53),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.h)))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h),
                                                    child: Text(
                                                        "lbl_chinese".tr,
                                                        style: CustomTextStyles
                                                            .bodyLargeABeeZeeBluegray40002)),
                                                Opacity(
                                                    opacity: 0.5,
                                                    child: Container(
                                                        height: 4.adaptSize,
                                                        width: 4.adaptSize,
                                                        margin: EdgeInsets.only(
                                                            left: 12.h,
                                                            top: 12.v,
                                                            bottom: 8.v),
                                                        decoration: BoxDecoration(
                                                            color: appTheme
                                                                .blueGray40002
                                                                .withOpacity(
                                                                    0.53),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.h)))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h),
                                                    child: Text(
                                                        "lbl_american".tr,
                                                        style: CustomTextStyles
                                                            .bodyLargeABeeZeeBluegray40002)),
                                                Opacity(
                                                    opacity: 0.5,
                                                    child: Container(
                                                        height: 4.adaptSize,
                                                        width: 4.adaptSize,
                                                        margin: EdgeInsets.only(
                                                            left: 8.h,
                                                            top: 12.v,
                                                            bottom: 8.v),
                                                        decoration: BoxDecoration(
                                                            color: appTheme
                                                                .blueGray40002
                                                                .withOpacity(
                                                                    0.53),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.h)))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.h),
                                                    child: Text(
                                                        "lbl_deshi_food".tr,
                                                        style: CustomTextStyles
                                                            .bodyLargeABeeZeeBluegray40002))
                                              ])),
                                      SizedBox(height: 9.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 4.h, right: 57.h),
                                          child: Row(children: [
                                            Opacity(
                                                opacity: 0.74,
                                                child: Text("lbl_4_3".tr,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyles
                                                        .bodySmallABeeZeeBlack900)),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgIcon24RatingOrange400,
                                                height: 20.adaptSize,
                                                width: 20.adaptSize,
                                                margin:
                                                    EdgeInsets.only(left: 6.h)),
                                            Opacity(
                                                opacity: 0.74,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.h),
                                                    child: Text(
                                                        "lbl_200_ratings".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallABeeZeeBlack900))),
                                            Opacity(
                                                opacity: 0.64,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgIcon24Clock,
                                                    height: 20.adaptSize,
                                                    width: 20.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 17.h))),
                                            Opacity(
                                                opacity: 0.74,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 6.h),
                                                    child: Text("lbl_25_min".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallABeeZeeBlack900))),
                                            Opacity(
                                                opacity: 0.5,
                                                child: Container(
                                                    height: 4.adaptSize,
                                                    width: 4.adaptSize,
                                                    margin: EdgeInsets.only(
                                                        left: 11.h,
                                                        top: 8.v,
                                                        bottom: 8.v),
                                                    decoration: BoxDecoration(
                                                        color: appTheme
                                                            .blueGray40002
                                                            .withOpacity(0.53),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    2.h)))),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgGroup,
                                                height: 16.v,
                                                width: 17.h,
                                                margin: EdgeInsets.only(
                                                    left: 10.h, bottom: 3.v)),
                                            Opacity(
                                                opacity: 0.74,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 9.h),
                                                    child: Text("lbl_free".tr,
                                                        style: CustomTextStyles
                                                            .bodySmallABeeZeeBlack900)))
                                          ]))
                                    ])))
                      ]))))
        ]));
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildBg(
    BuildContext context, {
    required String userImage,
  }) {
    return SizedBox(
        height: 185.v,
        width: 335.h,
        child: Stack(alignment: Alignment.bottomRight, children: [
          CustomImageView(
              imagePath: userImage,
              height: 185.v,
              width: 335.h,
              radius: BorderRadius.circular(12.h),
              alignment: Alignment.center),
          CustomImageView(
              imagePath: ImageConstant.imgIndicator,
              height: 5.v,
              width: 72.h,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 20.h, bottom: 20.v))
        ]));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
        return "/";
      case BottomBarEnum.Frame1000002311:
        return "/";
      case BottomBarEnum.Notification:
        return "/";
      case BottomBarEnum.Settings:
        return "/";
      default:
        return "/";
    }
  }

  // Navigates to the notificationsScreen when the action is triggered.
  onTapImgVector(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RemindersListScreen()));
  }

  // Navigates to the notificationsScreen when the action is triggered.
  onTapVector(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }
}
