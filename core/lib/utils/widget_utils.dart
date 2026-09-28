part of '../core.dart';

class WidgetUtils {
  static Future<void> showLoading() => EasyLoading.show();
  static Future<void> dismissLoading() => EasyLoading.dismiss();

  static void showSnackBar({
    EdgeInsetsGeometry? margin,
    required BuildContext context,
    required Color color,
    required Color backgroundColor,
    TextStyle? textStyle,
    required String title,
    Duration? duration,
    Widget? icon,
    DismissDirection? dismissDirection,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => _TopSnackBar(
        title: title,
        color: color,
        backgroundColor: backgroundColor,
        icon: icon,
        duration: duration ?? const Duration(seconds: 3),
        textStyle: textStyle,
        margin: margin,
        onDismissed: () {
          if (overlayEntry.mounted) {
            overlayEntry.remove();
          }
        },
      ),
    );

    overlay.insert(overlayEntry);
  }

  static void configLoading(Widget logo) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..radius = 10
      ..indicatorType = EasyLoadingIndicatorType.rotatingCircle
      ..indicatorColor = Colors.transparent
      ..userInteractions = false
      ..indicatorWidget = BrandLoading(logoDark: false, logo: logo)
      ..boxShadow = <BoxShadow>[]
      ..maskColor = Colors.black.withOpacity(0.6)
      ..backgroundColor = Colors.transparent
      ..maskType = EasyLoadingMaskType.custom
      ..dismissOnTap = false;
  }
}

class BrandLoading extends StatelessWidget {
  final bool logoDark;
  final double? size;
  final Widget logo;

  const BrandLoading({
    super.key,
    this.logoDark = false,
    required this.logo,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sizeLoading = size ?? screenWidth * 0.25;

    return Stack(
      alignment: Alignment.center,
      children: [
        SpinKitSpinningLines(
          color: logoDark ? Colors.white : const Color(0xFF016829),
          size: sizeLoading * 0.9,
          lineWidth: 3,
          duration: const Duration(milliseconds: 1200),
        ),
        Container(
          width: sizeLoading * 0.5,
          height: sizeLoading * 0.5,
          decoration: const ShapeDecoration(
            color: Colors.transparent,
            shape: CircleBorder(),
          ),
          child: logo,
        ),
      ],
    );
  }
}

class _TopSnackBar extends StatefulWidget {
  final String title;
  final Color color;
  final Color backgroundColor;
  final Widget? icon;
  final Duration duration;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onDismissed;

  const _TopSnackBar({
    required this.title,
    required this.color,
    required this.backgroundColor,
    this.icon,
    required this.duration,
    this.textStyle,
    this.margin,
    required this.onDismissed,
  });

  @override
  State<_TopSnackBar> createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<_TopSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  Timer? _timer;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();

    _timer = Timer(widget.duration, () {
      _dismiss();
    });
  }

  void _dismiss() {
    if (mounted) {
      setState(() {
        _isVisible = false;
      });
      // Wait for fade out duration then remove
      Future.delayed(const Duration(milliseconds: 300), () {
        widget.onDismissed();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _offsetAnimation,
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (widget.icon != null) ...[
                    widget.icon!,
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      widget.title,
                      style: widget.textStyle ??
                          const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      _timer?.cancel();
                      _dismiss();
                    },
                    child: Icon(
                      Icons.close,
                      color: widget.color,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
