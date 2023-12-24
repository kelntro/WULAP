import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = false,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget {
    final bool shouldAutofocus = controller == null;
    return SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode ?? FocusNode(),
        autofocus: shouldAutofocus,
        style: textStyle ?? CustomTextStyles.bodyMediumABeeZeeBluegray300,
        obscureText: obscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration,
        validator: validator,
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.bodyLargeDMSansBlack90002,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(15.h),
        fillColor: fillColor,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.purpleA700,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide(
                color: appTheme.purpleA700,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.h),
              borderSide: BorderSide(
                color: appTheme.black90002.withOpacity(0.56),
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlinePurpleATL8 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: appTheme.purpleA700,
          width: 1,
        ),
      );
  static UnderlineInputBorder get underLineGray => UnderlineInputBorder(
        borderSide: BorderSide(
          color: appTheme.gray300,
        ),
      );
  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillBlueGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillBlueGrayTL6 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get outlineBlackTL6 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide(
          color: appTheme.black90002,
          width: 1,
        ),
      );
  static OutlineInputBorder get fillPrimary => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide.none,
      );
  static OutlineInputBorder get fillPurpleA => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.h),
        borderSide: BorderSide.none,
      );

  get underLinePurple => null;
}
