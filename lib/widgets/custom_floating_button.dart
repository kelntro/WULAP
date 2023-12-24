import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({
    Key? key,
    this.alignment,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
    this.decoration,
    this.child,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final BoxDecoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: fabWidget,
          )
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: decoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(22.h),
              ),
          child: child,
        ),
      );
}

/// Extension on [CustomFloatingButton] to facilitate inclusion of all types of border style etc
extension FloatingButtonStyleHelper on CustomFloatingButton {
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(22.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineWhiteATL24 => BoxDecoration(
        color: appTheme.purpleA100,
        borderRadius: BorderRadius.circular(24.h),
        border: Border.all(
          color: appTheme.whiteA700,
          width: 2.h,
        ),
      );
}
