import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_radius.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';

enum CustomButtonVariant {
  primary,
  secondary,
  outline,
  danger,
  basic,
  tertiary,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = CustomButtonVariant.primary,
    this.height,
    this.width,
    this.leading,
    this.isExpanded = true,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.padding,
  });

  final String label;
  final VoidCallback? onPressed;
  final CustomButtonVariant variant;
  final double? height;
  final double? width;
  final Widget? leading;
  final bool isExpanded;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final (bg, fg, border) = switch (variant) {
      CustomButtonVariant.primary => (
        enabled
            ? AppColor.isDark(context)
                  ? AppColor.naviBlue500Dark
                  : AppColor.naviBlue500
            : AppColor.neutral8,
        AppColor.white,
        null,
      ),
      CustomButtonVariant.secondary => (
        AppColor.isDark(context) ? AppColor.bgTagDark : AppColor.neutral10,
        AppColor.isDark(context)
            ? AppColor.darkTitle
            : AppColor.isDark(context)
            ? AppColor.darkTitle
            : AppColor.neutral1,
        null,
      ),
      CustomButtonVariant.outline => (
        AppColor.isDark(context) ? AppColor.darkCard : AppColor.white,
        AppColor.isDark(context)
            ? AppColor.naviBlue500Dark
            : AppColor.naviBlue500,
        AppColor.isDark(context)
            ? AppColor.naviBlue500Dark
            : AppColor.naviBlue500,
      ),
      CustomButtonVariant.danger => (
        AppColor.isDark(context) ? AppColor.bgTagDark : AppColor.red10,
        AppColor.red5,
        AppColor.red5,
      ),
      CustomButtonVariant.basic => (
        AppColor.white,
        AppColor.isDark(context) ? AppColor.darkTitle : AppColor.neutral1,
        AppColor.border,
      ),
      CustomButtonVariant.tertiary => (
        Colors.white.withOpacity(0.12),
        AppColor.white,
        null,
      ),
    };

    final useGradient =
        variant == CustomButtonVariant.primary &&
        enabled &&
        backgroundColor == null;

    final child = Container(
      width: isExpanded ? double.infinity : width,
      height: height ?? 44.h,
      padding: padding,
      decoration: BoxDecoration(
        gradient: useGradient ? AppColor.navyBlueGradient : null,
        color: useGradient ? null : (backgroundColor ?? bg),
        borderRadius: BorderRadius.circular(AppRadius.pill.r),
        border: borderColor != null
            ? Border.all(color: borderColor!)
            : border != null
            ? Border.all(color: border)
            : null,
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
            SizedBox(width: AppSpacing.spacing2.w),
          ],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
                  textStyle ??
                  AppTextStyle.headingTextMD.copyWith(
                    color: textColor ?? fg,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.pill.r),
        child: child,
      ),
    );
  }
}
