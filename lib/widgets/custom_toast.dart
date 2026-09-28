import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_radius.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';
import 'package:vbindex/presentations/routes.dart';

enum CustomToastType { success, error, warning }

/// Toast từ trên xuống, vuốt lên hoặc nhấn X để đóng.
final class CustomToast {
  CustomToast._();

  static OverlayEntry? _entry;
  static Timer? _timer;

  static void success(
    String message, {
    BuildContext? context,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      type: CustomToastType.success,
      context: context,
      title: title,
      duration: duration,
    );
  }

  static void error(
    String message, {
    BuildContext? context,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      type: CustomToastType.error,
      context: context,
      title: title,
      duration: duration,
    );
  }

  static void warning(
    String message, {
    BuildContext? context,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      message: message,
      type: CustomToastType.warning,
      context: context,
      title: title,
      duration: duration,
    );
  }

  static void show({
    required String message,
    CustomToastType type = CustomToastType.success,
    BuildContext? context,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = _resolveOverlay(context);
    if (overlay == null) return;

    dismiss();

    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => _CustomToastHost(
        message: message,
        title: title,
        type: type,
        onDismiss: dismiss,
      ),
    );
    _entry = entry;
    overlay.insert(entry);

    if (duration > Duration.zero) {
      _timer = Timer(duration, dismiss);
    }
  }

  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _entry?.remove();
    _entry = null;
  }

  static OverlayState? _resolveOverlay(BuildContext? context) {
    if (context != null) {
      final overlay = Overlay.maybeOf(context, rootOverlay: true);
      if (overlay != null) return overlay;
    }
    return AppNavigator.navigatorKey.currentState?.overlay;
  }
}

class _ToastPalette {
  const _ToastPalette({
    required this.background,
    required this.border,
    required this.accent,
    required this.icon,
    required this.defaultTitle,
  });

  final Color background;
  final Color border;
  final Color accent;
  final IconData icon;
  final String defaultTitle;

  static _ToastPalette of(BuildContext context, CustomToastType type) {
    final isDark = AppColor.isDark(context);
    return switch (type) {
      CustomToastType.success => _ToastPalette(
        background: isDark
            ? Color.alphaBlend(
                AppColor.statusTang.withValues(alpha: 0.28),
                AppColor.darkCard,
              )
            : AppColor.successSoft,
        border: isDark
            ? AppColor.statusTang.withValues(alpha: 0.55)
            : const Color(0xFFB7E7C5),
        accent: AppColor.statusTang,
        icon: Icons.check_circle_rounded,
        defaultTitle: 'Thành công',
      ),
      CustomToastType.error => _ToastPalette(
        background: isDark
            ? Color.alphaBlend(
                AppColor.statusGiam.withValues(alpha: 0.28),
                AppColor.darkCard,
              )
            : AppColor.red10,
        border: isDark
            ? AppColor.statusGiam.withValues(alpha: 0.55)
            : const Color(0xFFF5C2C4),
        accent: AppColor.statusGiam,
        icon: Icons.error_rounded,
        defaultTitle: 'Lỗi',
      ),
      CustomToastType.warning => _ToastPalette(
        background: isDark
            ? Color.alphaBlend(
                AppColor.orange.withValues(alpha: 0.28),
                AppColor.darkCard,
              )
            : const Color(0xFFFFF6E8),
        border: isDark
            ? AppColor.orange.withValues(alpha: 0.55)
            : const Color(0xFFFFD9A0),
        accent: AppColor.orange,
        icon: Icons.warning_amber_rounded,
        defaultTitle: 'Cảnh báo',
      ),
    };
  }
}

class _CustomToastHost extends StatefulWidget {
  const _CustomToastHost({
    required this.message,
    required this.type,
    required this.onDismiss,
    this.title,
  });

  final String message;
  final String? title;
  final CustomToastType type;
  final VoidCallback onDismiss;

  @override
  State<_CustomToastHost> createState() => _CustomToastHostState();
}

class _CustomToastHostState extends State<_CustomToastHost>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;
  double _dragOffset = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
      reverseDuration: const Duration(milliseconds: 220),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (!mounted) return;
    await _controller.reverse();
    if (mounted) widget.onDismiss();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    // Vuốt lên (delta âm) mới kéo toast đi.
    if (details.delta.dy >= 0 && _dragOffset >= 0) return;
    setState(() {
      _dragOffset = (_dragOffset + details.delta.dy).clamp(-120.0, 0.0);
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    final shouldDismiss =
        _dragOffset < -48 ||
        details.primaryVelocity != null && details.primaryVelocity! < -600;
    if (shouldDismiss) {
      _close();
      return;
    }
    setState(() => _dragOffset = 0);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isDark = AppColor.isDark(context);
    final palette = _ToastPalette.of(context, widget.type);
    final title = widget.title?.trim().isNotEmpty == true
        ? widget.title!.trim()
        : palette.defaultTitle;

    return Positioned(
      top: media.padding.top + AppSpacing.spacing2.h,
      left: AppSpacing.spacing4.w,
      right: AppSpacing.spacing4.w,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Transform.translate(
            offset: Offset(0, _dragOffset),
            child: GestureDetector(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: Material(
                color: Colors.transparent,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: palette.background,
                    borderRadius: BorderRadius.circular(AppRadius.xl.r),
                    border: Border.all(color: palette.border),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withValues(
                          alpha: isDark ? 0.35 : 0.08,
                        ),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.spacing3.w,
                      AppSpacing.spacing3.h,
                      AppSpacing.spacing2.w,
                      AppSpacing.spacing3.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: palette.accent.withValues(
                              alpha: isDark ? 0.2 : 0.12,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            palette.icon,
                            size: 18.sp,
                            color: palette.accent,
                          ),
                        ),
                        SizedBox(width: AppSpacing.spacing2.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                title,
                                style: AppTextStyle.headingTextSM.copyWith(
                                  color: palette.accent,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                widget.message,
                                style: AppTextStyle.bodyTextSM.copyWith(
                                  color: AppColor.textOnCard(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: AppSpacing.spacing1.w),
                        GestureDetector(
                          onTap: _close,
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: EdgeInsets.all(AppSpacing.spacing1.w),
                            child: Icon(
                              Icons.close_rounded,
                              size: 18.sp,
                              color: isDark
                                  ? AppColor.textOnTagDark
                                  : AppColor.neutral5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
