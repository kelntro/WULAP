import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

class CategoriesfoodgridItemWidget extends StatelessWidget {
  CategoriesfoodgridItemWidget({
    Key? key,
    this.onTapImgUserImage,
    required this.imagePath,
    required this.categoryText,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback? onTapImgUserImage;
  final String imagePath;
  final String categoryText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 160.adaptSize,
            width: 160.adaptSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: imagePath,
                  height: 160.adaptSize,
                  width: 160.adaptSize,
                  radius: BorderRadius.circular(10.h),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    categoryText,
                    style: CustomTextStyles.bodyLargeABeeZeeWhiteA700,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
