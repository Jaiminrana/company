import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:company/utils/common%20widgets/jr_network_Image.dart';

class JRSvgPicture extends StatelessWidget {
  const JRSvgPicture({
    required this.assetName,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.onTap,
    this.isSvgNetwork = false,
    super.key,
  });

  final String assetName;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final VoidCallback? onTap;
  final bool isSvgNetwork;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: isSvgNetwork
          ? SvgPicture.network(
        assetName,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: color != null
            ? ColorFilter.mode(
          color!,
          BlendMode.srcIn,
        )
            : null,
        placeholderBuilder: (context) =>
            JRPlaceHolder(
              width:width,
              height:height,
            ),
      )
          : SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: color != null
            ? ColorFilter.mode(
          color!,
          BlendMode.srcIn,
        )
            : null,
      ),
    );
  }
}
