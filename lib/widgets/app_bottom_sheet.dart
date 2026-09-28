import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_radius.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';

import 'touch_close_keyboard.dart';

class AppBottomSheet {
  AppBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isScrollControlled = true,
    bool isFullScreen = false,
    bool useRootNavigator = true,
    Color barrierColor = Colors.black54,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      backgroundColor: Colors.transparent,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (sheetContext) {
        if (!isFullScreen) {
          // Keep sheet height = content so the modal barrier stays tappable.
          return child;
        }

        final height = MediaQuery.sizeOf(sheetContext).height;
        return SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              if (isDismissible)
                Positioned.fill(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.of(sheetContext).maybePop(),
                  ),
                ),
              child,
            ],
          ),
        );
      },
    );
  }
}

class AppBottomSheetScaffold extends StatelessWidget {
  const AppBottomSheetScaffold({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
    this.showClose = false,
    this.onClose,
    this.footer,
    this.maxHeightFactor = 0.92,
    this.isFullScreen = false,
    this.showGrabber = false,
    this.backgroundColor,
    this.centerTitle = false,
    this.titlePadding,
    this.pinnedHeader,
  });

  final String title;
  final Widget child;
  final Widget? trailing;
  final bool showClose;
  final VoidCallback? onClose;
  final Widget? footer;
  final double maxHeightFactor;
  final bool isFullScreen;
  final bool showGrabber;
  final Color? backgroundColor;
  final bool centerTitle;
  final EdgeInsetsGeometry? titlePadding;
  final Widget? pinnedHeader;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final maxHeight = screenHeight * maxHeightFactor;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: TouchCloseSoftKeyboard(
        child: Container(
          width: double.infinity,
          height: isFullScreen ? screenHeight - bottomInset : null,
          constraints: isFullScreen
              ? null
              : BoxConstraints(maxHeight: maxHeight),
          decoration: BoxDecoration(
            color:
                backgroundColor ??
                (AppColor.isDark(context)
                    ? AppColor.darkBackground
                    : AppColor.backgroundLight),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppRadius.xxl.r),
            ),
          ),
          child: SafeArea(
            top: isFullScreen,
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing4.w,
                vertical: AppSpacing.spacing6.h,
              ),
              child: Column(
                mainAxisSize: isFullScreen
                    ? MainAxisSize.max
                    : MainAxisSize.min,
                children: [
                  if (showGrabber) ...[
                    SizedBox(height: AppSpacing.spacing2.h),
                    Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: AppColor.isDark(context)
                            ? AppColor.borderDark
                            : AppColor.neutral9,
                        borderRadius: BorderRadius.circular(AppRadius.pill.r),
                      ),
                    ),
                  ],
                  Row(
                    children: [
                      if (centerTitle)
                        showClose
                            ? _buildCloseButton(context)
                            : SizedBox(width: 48.w),
                      Expanded(
                        child: Padding(
                          padding:
                              titlePadding ??
                              (isFullScreen
                                  ? EdgeInsets.only(top: AppSpacing.spacing6.h)
                                  : EdgeInsets.zero),
                          child: Text(
                            title,
                            textAlign: centerTitle
                                ? TextAlign.center
                                : TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.headingTextLG.copyWith(
                              color: AppColor.isDark(context)
                                  ? AppColor.darkTitle
                                  : AppColor.neutral1,
                            ),
                          ),
                        ),
                      ),
                      if (trailing != null)
                        Padding(
                          padding:
                              titlePadding ??
                              (isFullScreen
                                  ? EdgeInsets.only(top: AppSpacing.spacing6.h)
                                  : EdgeInsets.zero),
                          child: trailing!,
                        ),
                      if (showClose && !centerTitle) _buildCloseButton(context),
                      if (centerTitle && trailing == null)
                        SizedBox(width: 48.w),
                    ],
                  ),
                  SizedBox(height: AppSpacing.spacing5.h),
                  if (pinnedHeader != null) ...[
                    pinnedHeader!,
                    SizedBox(height: AppSpacing.spacing4.h),
                  ],
                  if (isFullScreen)
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: AppSpacing.spacing4.h),
                        child: child,
                      ),
                    )
                  else
                    // FlexFit.loose: shrink-wrap short content, but never exceed
                    // remaining height under the sheet's maxHeight (avoids overflow
                    // with header + footer + tall form).
                    Flexible(
                      fit: FlexFit.loose,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: AppSpacing.spacing4.h),
                        child: child,
                      ),
                    ),
                  SizedBox(height: AppSpacing.spacing3.h),
                  if (footer != null) footer!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Container(
      padding:
          titlePadding ??
          (isFullScreen
              ? EdgeInsets.only(top: AppSpacing.spacing6.h)
              : EdgeInsets.zero),
      width: 40.w,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onClose ?? () => Navigator.of(context).maybePop(),
        child: Icon(
          Icons.close_rounded,
          color: AppColor.isDark(context) ? AppColor.darkTitle : AppColor.black,
          size: 24.sp,
        ),
      ),
    );
  }
}
