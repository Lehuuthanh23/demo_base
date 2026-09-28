import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_images.dart';
import 'package:vbindex/constants/app_spacing.dart';
import 'package:vbindex/constants/app_textstyle.dart';

/// Shared empty state: silver app icon above a title.
/// Shrinks / drops the illustration when parent height is tight.
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.title, this.padding});

  final String title;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxH = constraints.maxHeight;
        final tight = maxH.isFinite && maxH < 100;
        final veryTight = maxH.isFinite && maxH < 48;
        final resolvedPadding =
            padding ??
            EdgeInsets.symmetric(
              vertical: tight ? AppSpacing.spacing1.h : AppSpacing.spacing6.h,
              horizontal: 16.w,
            );

        final content = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!veryTight) ...[
              Image.asset(
                AppImages.empty,
                width: tight ? 48.w : 83.w,
                height: tight ? 32.w : 55.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: AppSpacing.spacing2.h),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: veryTight ? 2 : 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.bodyTextSM.copyWith(
                color: AppColor.neutral5,
                fontSize: veryTight ? 11.sp : null,
              ),
            ),
          ],
        );

        return Center(
          child: Padding(
            padding: resolvedPadding,
            child: tight
                ? FittedBox(fit: BoxFit.scaleDown, child: content)
                : content,
          ),
        );
      },
    );
  }
}
