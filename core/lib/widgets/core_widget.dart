part of '../core.dart';

abstract class CoreWidget<T extends Cubit<CoreState>> extends StatefulWidget {
  final AppTheme? theme;

  const CoreWidget({
    Key? key,
    this.theme,
  }) : super(key: key);

  @protected
  Widget build(BuildContext context, AppLocalizations tr);

  @protected
  @mustCallSuper
  void onInit(BuildContext context) {}

  @protected
  @mustCallSuper
  void onDispose(BuildContext context) {}

  @override
  State<CoreWidget<T>> createState() => _CoreWidgetState<T>();
}

class _CoreWidgetState<T extends Cubit<CoreState>> extends State<CoreWidget<T>> {
  @override
  void initState() {
    widget.onInit(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final theme = widget.theme ?? context.watch<T>().state.theme;
    final t = Utils.languageOf(context);
    return widget.build(context, t);
  }

  @override
  void dispose() {
    widget.onDispose(context);
    super.dispose();
  }
}

/// Custom spin loader widget tương tự CargoSpinLoader
class CoreSpinLoader extends StatefulWidget {
  final double size;
  final double strokeWidth;
  final Duration duration;
  final Color? color;

  const CoreSpinLoader({
    super.key,
    this.size = 50.0,
    this.strokeWidth = 4.0,
    this.duration = const Duration(milliseconds: 1200),
    this.color,
  });

  @override
  State<CoreSpinLoader> createState() => _CoreSpinLoaderState();
}

class _CoreSpinLoaderState extends State<CoreSpinLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).primaryColor;
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotation.value * 2 * 3.14159,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: _SpinPainter(
                  progress: _rotation.value,
                  color: color,
                  strokeWidth: widget.strokeWidth,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SpinPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _SpinPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - strokeWidth / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = LinearGradient(
        colors: [
          color.withOpacity(0.3),
          color,
          color.withOpacity(0.3),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    // Vẽ 3/4 vòng tròn
    final startAngle = -3.14159 / 2; // 12h
    final sweepAngle = 3.14159 * 1.5; // 270 độ

    // Xoay theo progress
    final rotatedAngle = startAngle + progress * 2 * 3.14159;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      rotatedAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
