import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_radius.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';
import 'package:vbindex/widgets/custom_button.dart';

Future<bool?> showCustomDialog({
  required BuildContext context,
  required String title,
  String? content,
  Widget? contentWidget,
  Widget? footer,
  bool showCancel = true,
  String cancelLabel = 'Hủy',
  String acceptLabel = 'Đồng ý',
  bool destructiveAccept = false,
  VoidCallback? onCancel,
  VoidCallback? onAccept,
  bool barrierDismissible = true,
}) {
  assert(
    content != null || contentWidget != null,
    'Either content or contentWidget must be provided.',
  );

  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => CustomDialog(
      title: title,
      content: content,
      contentWidget: contentWidget,
      footer: footer,
      showCancel: showCancel,
      cancelLabel: cancelLabel,
      acceptLabel: acceptLabel,
      destructiveAccept: destructiveAccept,
      onCancel: onCancel,
      onAccept: onAccept,
    ),
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    this.content,
    this.contentWidget,
    this.footer,
    this.showCancel = true,
    this.cancelLabel = 'Hủy',
    this.acceptLabel = 'Đồng ý',
    this.destructiveAccept = false,
    this.onCancel,
    this.onAccept,
  }) : assert(
         content != null || contentWidget != null,
         'Either content or contentWidget must be provided.',
       );

  final String title;
  final String? content;
  final Widget? contentWidget;
  final Widget? footer;
  final bool showCancel;
  final String cancelLabel;
  final String acceptLabel;
  final bool destructiveAccept;
  final VoidCallback? onCancel;
  final VoidCallback? onAccept;

  void _onCancel(BuildContext context) {
    onCancel?.call();
    Navigator.of(context).maybePop(false);
  }

  void _onAccept(BuildContext context) {
    onAccept?.call();
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final maxDialogHeight = MediaQuery.sizeOf(context).height * 0.85;

    return Dialog(
      backgroundColor: AppColor.isDark(context)
          ? AppColor.darkCard
          : AppColor.white,
      insetPadding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing4.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl.r),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxDialogHeight),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.spacing4.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyle.headingTextLG.copyWith(
                  color: AppColor.isDark(context)
                      ? AppColor.darkTitle
                      : AppColor.isDark(context)
                      ? AppColor.darkTitle
                      : AppColor.neutral1,
                ),
              ),
              SizedBox(height: AppSpacing.spacing3.h),
              if (contentWidget != null)
                Flexible(child: contentWidget!)
              else
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 240.h),
                    child: SingleChildScrollView(
                      child: Text(
                        content!,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyTextMD.copyWith(
                          color: AppColor.neutral5,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: AppSpacing.spacing5.h),
              footer ??
                  Row(
                    children: [
                      if (showCancel) ...[
                        Expanded(
                          child: CustomButton(
                            label: cancelLabel,
                            variant: CustomButtonVariant.secondary,
                            onPressed: () => _onCancel(context),
                          ),
                        ),
                        SizedBox(width: AppSpacing.spacing2.w),
                      ],
                      Expanded(
                        child: CustomButton(
                          label: acceptLabel,
                          variant: destructiveAccept
                              ? CustomButtonVariant.danger
                              : CustomButtonVariant.primary,
                          onPressed: () => _onAccept(context),
                        ),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
