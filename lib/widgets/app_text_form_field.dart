import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_radius.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/widgets/label_widget.dart';

import '../constants/app_textstyle.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.filled = true,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.contentPadding,
    this.borderRadius,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.subLabel,
    this.height,
    this.obscureText = false,
    this.focusNode,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final String? subLabel;
  final double? height;
  final bool obscureText;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final radius =
        borderRadius ?? (maxLines == 1 ? AppRadius.pill.r : AppRadius.lg.r);

    final isSingleLine = (maxLines ?? 1) <= 1 && (minLines ?? 1) <= 1;
    final fieldHeight = height ?? (isSingleLine ? 44.h : null);
    // readOnly fields (esp. pickers) have no TextInputConnection; iOS
    // SystemContextMenu asserts without one — disable selection / use Flutter toolbar.
    final allowSelection = !readOnly;
    final focusedBorderColor =
        this.focusedBorderColor ??
        (AppColor.isDark(context)
            ? AppColor.naviBlue500Dark
            : AppColor.naviBlue500);
    final fillColor =
        this.fillColor ??
        (AppColor.isDark(context) ? AppColor.bgSurface : AppColor.white);
    final field = SizedBox(
      height: fieldHeight,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        initialValue: controller == null ? initialValue : null,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        inputFormatters: inputFormatters,
        enableInteractiveSelection: allowSelection,
        showCursor: allowSelection,
        // Avoid iOS SystemContextMenu (asserts without TextInputConnection).
        contextMenuBuilder: (context, editableTextState) {
          return AdaptiveTextSelectionToolbar.editableText(
            editableTextState: editableTextState,
          );
        },
        style: AppTextStyle.bodyTextBase.copyWith(
          color: AppColor.isDark(context)
              ? AppColor.darkTitle
              : AppColor.isDark(context)
              ? AppColor.darkTitle
              : AppColor.neutral1,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyle.bodyTextBase.copyWith(
            color: AppColor.isDark(context)
                ? AppColor.textOnTagDark
                : AppColor.neutral7,
          ),
          filled: filled,
          fillColor: fillColor,
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(
                    left: AppSpacing.spacing4.w,
                    right: AppSpacing.spacing1.w,
                  ),
                  child: prefixIcon,
                ),
          prefixIconConstraints: prefixIcon == null
              ? null
              : prefixIconConstraints ??
                    const BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: AppSpacing.spacing2.w),
            child: suffixIcon,
          ),
          suffixIconConstraints: suffixIcon == null
              ? null
              : suffixIconConstraints ??
                    const BoxConstraints(minWidth: 0, minHeight: 0),
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing3.w,
                vertical: 10.h,
              ),
          border: _border(borderColor, radius),
          enabledBorder: _border(borderColor, radius),
          focusedBorder: _border(focusedBorderColor, radius),
          errorBorder: _border(AppColor.red5, radius),
          disabledBorder: _border(borderColor, radius),
        ),
      ),
    );

    if (label == null) return field;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWidget(label: label!, subLabel: subLabel),
        SizedBox(height: AppSpacing.spacing1.h),
        field,
      ],
    );
  }

  OutlineInputBorder _border(Color? color, double radius) {
    if (color == null) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      );
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color),
    );
  }
}
