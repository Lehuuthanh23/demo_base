import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_icons.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';
import 'package:vbindex/widgets/app_svg_icon.dart';
import 'package:vbindex/presentations/routes.dart';

import 'touch_close_keyboard.dart';

class BasePageAction {
  const BasePageAction({
    this.icon,
    this.onTap,
    this.iconSize = 24,
    this.iconWidget,
  });

  final IconData? icon;
  final VoidCallback? onTap;
  final double iconSize;
  final Widget? iconWidget;
}

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.body,
    this.showLeading = false,
    this.onLeadingTap,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions = const [],
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.showBottomNavigationBar = false,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.systemUiOverlayStyle,
    this.safeAreaBottom = false,
    this.bodyPadding,
    this.bottomNavBodyInset,
    this.showTime = false,
    this.centerTitle = false,
    this.titleColor,
    this.leadingIconColor,
    this.resizeToAvoidBottomInset = true,
    this.safeAreaTop = true,
    this.padding,
  });

  final Widget body;
  final bool showLeading;
  final VoidCallback? onLeadingTap;
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<BasePageAction> actions;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool showBottomNavigationBar;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final bool safeAreaBottom;
  final bool safeAreaTop;
  final EdgeInsetsGeometry? bodyPadding;
  final bool showTime;
  final bool centerTitle;
  final Color? titleColor;
  final Color? leadingIconColor;
  final bool resizeToAvoidBottomInset;
  final EdgeInsets? padding;

  /// Scroll-end inset above bottom bar (FAB overhang + gap).
  /// Applied inside [SingleChildScrollView] padding, not as outer viewport
  /// padding — so content can scroll down to the bar first.
  final double? bottomNavBodyInset;

  bool get _showHeader =>
      showLeading ||
      title != null ||
      titleWidget != null ||
      leading != null ||
      actions.isNotEmpty;

  double _scrollBottomInset(BuildContext context) {
    if (!showBottomNavigationBar) return 0;
    if (bottomNavBodyInset != null) return bottomNavBodyInset!;
    // Body extends under the bar (extendBody); keep last content clear of
    // safe area + bar + diamond overhang.
    return MediaQuery.paddingOf(context).bottom + 72.h + AppSpacing.spacing4.h;
  }

  EdgeInsets _resolveBodyPadding(BuildContext context) {
    if (bodyPadding != null) {
      return bodyPadding!.resolve(Directionality.of(context));
    }
    return EdgeInsets.symmetric(horizontal: 16.w);
  }

  /// Injects scroll-end bottom inset via [MediaQuery] so nested scroll views
  /// pad the end of content only. Top/horizontal are cleared here because
  /// [SafeArea] and [Padding] on the body already handle those — otherwise
  /// lists would show an extra gap above the content.
  Widget _withScrollBottomInset(
    BuildContext context,
    Widget child,
    double inset,
  ) {
    if (inset <= 0) return child;

    final media = MediaQuery.of(context);
    return MediaQuery(
      data: media.copyWith(padding: EdgeInsets.only(bottom: inset)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = this.padding ?? _resolveBodyPadding(context);
    final scrollInset = _scrollBottomInset(context);
    final isDark = AppColor.isDark(context);
    final resolvedBackground =
        backgroundColor ?? AppColor.pageBackground(context);
    final resolvedTitleColor = titleColor ?? AppColor.pageTitle(context);
    final resolvedLeadingColor =
        leadingIconColor ??
        (isDark ? AppColor.darkTitle : AppColor.textPrimary);
    final resolvedOverlayStyle =
        systemUiOverlayStyle ??
        (isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: resolvedOverlayStyle,
      child: Scaffold(
        backgroundColor: resolvedBackground,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: showBottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonAnimator: floatingActionButton != null
            ? FloatingActionButtonAnimator.noAnimation
            : FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: showBottomNavigationBar
            ? bottomNavigationBar
            : null,
        body: TouchCloseSoftKeyboard(
          child: SafeArea(
            top: safeAreaTop,
            bottom: safeAreaBottom,
            child: Column(
              children: [
                if (_showHeader)
                  _BasePageHeader(
                    showLeading: showLeading,
                    onLeadingTap: onLeadingTap ?? () => AppNavigator.pop(),
                    title: title,
                    titleWidget: titleWidget,
                    leading: leading,
                    actions: actions,
                    showTime: showTime,
                    centerTitle: centerTitle,
                    titleColor: resolvedTitleColor,
                    leadingIconColor: resolvedLeadingColor,
                  ),
                Expanded(
                  child: Padding(
                    padding: padding,
                    child: _withScrollBottomInset(context, body, scrollInset),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BasePageHeader extends StatelessWidget {
  const _BasePageHeader({
    required this.showLeading,
    required this.onLeadingTap,
    this.title,
    this.titleWidget,
    this.leading,
    required this.actions,
    this.showTime = false,
    this.centerTitle = false,
    required this.titleColor,
    required this.leadingIconColor,
  });

  final bool showLeading;
  final VoidCallback onLeadingTap;
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<BasePageAction> actions;
  final bool showTime;
  final bool centerTitle;
  final Color titleColor;
  final Color leadingIconColor;

  Widget _titleText() {
    return titleWidget ??
        Text(
          title ?? '',
          textAlign: centerTitle ? TextAlign.center : TextAlign.start,
          style: AppTextStyle.headingTextXL.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w600,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final backButton = showLeading
        ? _BasePageIconButton(
            onTap: onLeadingTap,
            iconWidget: AppSvgIcon(
              assetPath: AppIcons.backArrow,
              size: 32.sp,
              color: leadingIconColor,
            ),
          )
        : null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          if (centerTitle)
            SizedBox(
              height: 44.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      if (backButton != null) backButton,
                      if (leading != null) ...[
                        if (backButton != null) SizedBox(width: 4.w),
                        leading!,
                      ],
                      const Spacer(),
                      ...actions.map(
                        (action) => _BasePageIconButton(
                          icon: action.icon,
                          onTap: action.onTap,
                          iconSize: action.iconSize,
                          iconWidget: action.iconWidget,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: _titleText(),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                if (backButton != null) ...[backButton, SizedBox(width: 4.w)],
                if (leading != null) ...[leading!, SizedBox(width: 8.w)],
                Expanded(child: _titleText()),
                ...actions.map(
                  (action) => _BasePageIconButton(
                    icon: action.icon,
                    onTap: action.onTap,
                    iconSize: action.iconSize,
                    iconWidget: action.iconWidget,
                  ),
                ),
              ],
            ),
          if (showTime) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _formatVietnameseDate(DateTime.now()),
                style: AppTextStyle.bodyTextXS.copyWith(
                  color: AppColor.neutral5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String _formatVietnameseDate(DateTime date) {
  const weekdays = [
    'Thứ 2',
    'Thứ 3',
    'Thứ 4',
    'Thứ 5',
    'Thứ 6',
    'Thứ 7',
    'Chủ nhật',
  ];
  final weekday = weekdays[date.weekday - 1];
  return '$weekday, ${date.day} tháng ${date.month}, ${date.year}';
}

class _BasePageIconButton extends StatelessWidget {
  const _BasePageIconButton({
    this.icon,
    this.onTap,
    this.iconSize = 24,
    this.iconWidget,
  });

  final IconData? icon;
  final VoidCallback? onTap;
  final double iconSize;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      visualDensity: VisualDensity.compact,
      icon:
          iconWidget ??
          Icon(
            icon,
            color: AppColor.textOnCard(context),
            size: iconSize.sp,
          ),
    );
  }
}
