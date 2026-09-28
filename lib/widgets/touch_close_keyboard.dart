import 'package:flutter/material.dart';

/// 触摸关闭键盘
class TouchCloseSoftKeyboard extends StatelessWidget {
  final Widget child;
  final Function? onTouch;
  final bool isGradientBg;

  const TouchCloseSoftKeyboard({
    super.key,
    required this.child,
    this.onTouch,
    this.isGradientBg = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
        onTouch?.call();
      },
      child: isGradientBg
          ? Container(
              child: child,
            )
          : child,
    );
  }
}
