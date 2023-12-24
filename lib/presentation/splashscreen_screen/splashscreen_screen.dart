import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/presentation/log_in_screen/log_in_screen.dart';

class SplashscreenScreen extends StatefulWidget {
  const SplashscreenScreen({Key? key}) : super(key: key);

  @override
  _SplashscreenScreenState createState() => _SplashscreenScreenState();
}

class _SplashscreenScreenState extends State<SplashscreenScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay of 5 seconds before navigating to the next screen.
    Future.delayed(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LogInScreen(), // Replace with your screen.
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.blueGray90001,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 48.v),
            child: SizedBox(
              height: 593.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 93.v,
                      width: 126.h,
                      margin: EdgeInsets.only(bottom: 72.v),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorWhiteA700,
                            height: 60.v,
                            width: 97.h,
                            alignment: Alignment.bottomRight,
                          ),
                          Opacity(
                            opacity: 0.3,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgIcOutlineCloud,
                              height: 90.v,
                              width: 102.h,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 466.v,
                      width: 372.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 120.v,
                              width: 169.h,
                              margin: EdgeInsets.only(right: 69.h),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Opacity(
                                    opacity: 0.3,
                                    child: CustomImageView(
                                      imagePath: ImageConstant
                                          .imgIcOutlineCloudPurpleA700,
                                      height: 90.v,
                                      width: 106.h,
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgVectorDeepPurpleA100,
                                    height: 60.v,
                                    width: 97.h,
                                    alignment: Alignment.bottomRight,
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVectorWhiteA700,
                                    height: 60.v,
                                    width: 97.h,
                                    alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.only(bottom: 21.v),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _buildIcOutlineCloudStack(context),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 77.v,
                      width: 86.h,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorDeepPurpleA100,
                            height: 60.v,
                            width: 86.h,
                            alignment: Alignment.bottomCenter,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorWhiteA700,
                            height: 60.v,
                            width: 97.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 177.v,
      leadingWidth: 89.h,
      leading: Container(
        height: 81.v,
        width: 89.h,
        margin: EdgeInsets.only(bottom: 45.v),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Opacity(
              opacity: 0.5,
              child: CustomImageView(
                imagePath: ImageConstant.imgIcOutlineCloud,
                height: 90.v,
                width: 102.h,
                alignment: Alignment.topLeft,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVectorWhiteA700,
              height: 60.v,
              width: 97.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10.h),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          height: 81.v,
          width: 112.h,
          margin: EdgeInsets.only(top: 45.v),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVectorWhiteA700,
                height: 60.v,
                width: 97.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10.h),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVectorDeepPurpleA100,
                margin: EdgeInsets.only(
                  top: 21.v,
                  right: 15.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildIcOutlineCloudStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 350.v,
        width: 372.h,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Opacity(
              opacity: 0.3,
              child: CustomImageView(
                imagePath: ImageConstant.imgIcOutlineCloud,
                height: 90.v,
                width: 53.h,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 10.v),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVectorDeepPurpleA100,
              height: 60.v,
              width: 97.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 100.h),
            ),
            Opacity(
              opacity: 0.3,
              child: CustomImageView(
                imagePath: ImageConstant.imgIcOutlineCloudPurpleA700,
                height: 90.v,
                width: 106.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: 85.h,
                  top: 4.v,
                ),
              ),
            ),
            Opacity(
              opacity: 0.3,
              child: CustomImageView(
                imagePath: ImageConstant.imgIcOutlineCloud,
                height: 90.v,
                width: 86.h,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 49.v),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVectorWhiteA700,
              height: 60.v,
              width: 97.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                left: 44.h,
                bottom: 67.v,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVectorWhiteA700,
              height: 60.v,
              width: 97.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 119.h),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVectorDeepPurpleA100,
              height: 60.v,
              width: 97.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                left: 71.h,
                bottom: 40.v,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgImage6,
              height: 261.v,
              width: 353.h,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
