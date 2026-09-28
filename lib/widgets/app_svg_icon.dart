import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon({
    super.key,
    required this.assetPath,
    required this.size,
    this.color,
    this.semanticsLabel,
    this.fit = BoxFit.contain,
  });

  final String assetPath;
  final double size;
  final Color? color;
  final String? semanticsLabel;
  final BoxFit fit;

  bool get _isRaster {
    final path = assetPath.toLowerCase();
    return path.endsWith('.png') ||
        path.endsWith('.jpg') ||
        path.endsWith('.jpeg') ||
        path.endsWith('.webp');
  }

  @override
  Widget build(BuildContext context) {
    if (_isRaster) {
      final image = Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: fit,
        semanticLabel: semanticsLabel,
        filterQuality: FilterQuality.medium,
      );
      if (color == null) return image;
      return ColorFiltered(
        colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
        child: image,
      );
    }

    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
      fit: fit,
      semanticsLabel: semanticsLabel,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
