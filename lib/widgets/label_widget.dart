import 'package:flutter/material.dart';
import 'package:vbindex/constants/app_color.dart';
import 'package:vbindex/constants/app_textstyle.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.label, this.subLabel});

  final String label;
  final String? subLabel;

  @override
  Widget build(BuildContext context) {
    if (subLabel == null || subLabel!.isEmpty) {
      return Text(
        label,
        style: AppTextStyle.bodyTextBase.copyWith(
          color: AppColor.isDark(context)
              ? AppColor.darkTitle
              : AppColor.isDark(context)
              ? AppColor.darkTitle
              : AppColor.neutral1,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: AppTextStyle.bodyTextBase.copyWith(
              color: AppColor.isDark(context)
                  ? AppColor.darkTitle
                  : AppColor.isDark(context)
                  ? AppColor.darkTitle
                  : AppColor.neutral1,
            ),
          ),
          TextSpan(
            text: ' $subLabel',
            style: AppTextStyle.bodyTextSM.copyWith(
              color: AppColor.isDark(context)
                  ? AppColor.textOnTagDark
                  : AppColor.neutral4,
            ),
          ),
        ],
      ),
    );
  }
}
