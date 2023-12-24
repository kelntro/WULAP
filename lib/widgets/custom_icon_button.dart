import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(12.h),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(6.h),
      );
  static BoxDecoration get fillPurpleA => BoxDecoration(
        color: appTheme.purpleA700.withOpacity(0.3),
        borderRadius: BorderRadius.circular(22.h),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.deepPurple400,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray80001.withOpacity(0.24),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              -8,
              -8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteATL24 => BoxDecoration(
        color: appTheme.purpleA200,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.green300.withOpacity(0.4),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              -8,
              -8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteATL241 => BoxDecoration(
        color: appTheme.green300,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.green300.withOpacity(0.4),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              -8,
              -8,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineWhiteATL242 => BoxDecoration(
        color: appTheme.deepOrange100,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 2.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.gray80001.withOpacity(0.24),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              -8,
              -8,
            ),
          ),
        ],
      );
  static BoxDecoration get fillPrimaryTL12 => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12.h),
      );
}
