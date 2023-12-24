import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray10001.withOpacity(0.5),
      );
  static BoxDecoration get fillBluegray10001 => BoxDecoration(
        color: appTheme.blueGray10001,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10002,
      );
  static BoxDecoration get fillGray10003 => BoxDecoration(
        color: appTheme.gray10003,
      );
  static BoxDecoration get fillGray20005 => BoxDecoration(
        color: appTheme.gray20005,
      );
  static BoxDecoration get fillGray40033 => BoxDecoration(
        color: appTheme.gray40033,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimary1 => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.2),
      );
  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple50,
      );
  static BoxDecoration get fillPurple5001 => BoxDecoration(
        color: appTheme.purple5001,
      );
  static BoxDecoration get fillPurple50011 => BoxDecoration(
        color: appTheme.purple5001.withOpacity(0.5),
      );
  static BoxDecoration get fillPurpleA => BoxDecoration(
        color: appTheme.purpleA70047,
      );
  static BoxDecoration get fillPurpleA700 => BoxDecoration(
        color: appTheme.purpleA700.withOpacity(0.08),
      );
  static BoxDecoration get fillPurpleA7001 => BoxDecoration(
        color: appTheme.purpleA700,
      );
  static BoxDecoration get fillPurpleA7002 => BoxDecoration(
        color: appTheme.purpleA700.withOpacity(0.2),
      );
  static BoxDecoration get fillPurpleA7003 => BoxDecoration(
        color: appTheme.purpleA700.withOpacity(0.1),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.black90002,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlack90001 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.black90001,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90002,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack90002 => BoxDecoration();
  static BoxDecoration get outlineBlack900021 => BoxDecoration(
        border: Border.all(
          color: appTheme.black90002,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray40002,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBluegray40001 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray40001,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineBluegray400011 => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray40001,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineDeepPurpleA => BoxDecoration(
        color: appTheme.purpleA700.withOpacity(0.05),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray20001 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray20001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray40001 => BoxDecoration(
        border: Border.all(
          color: appTheme.gray40001,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGrayC => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.5),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray9000c,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              20,
            ),
          ),
        ],
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePurpleA => BoxDecoration(
        border: Border.all(
          color: appTheme.purpleA700,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get circleBorder34 => BorderRadius.circular(
        34.h,
      );
  static BorderRadius get circleBorder44 => BorderRadius.circular(
        44.h,
      );
  static BorderRadius get circleBorder53 => BorderRadius.circular(
        53.h,
      );
  static BorderRadius get circleBorder80 => BorderRadius.circular(
        80.h,
      );

  // Custom borders
  static BorderRadius get customBorderLR16 => BorderRadius.horizontal(
        right: Radius.circular(16.h),
      );
  static BorderRadius get customBorderTL33 => BorderRadius.vertical(
        top: Radius.circular(33.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6.h,
      );
  static BorderRadius get roundedBorder9 => BorderRadius.circular(
        9.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    